namespace :cold_storage do
  desc "Persist kits to JSON, using stable identifiers to anchor associations"
  task freeze: :environment do
    outpath = ColdStorage.freeze

    puts "Saved all kit data to #{outpath}"
  end

  desc "Clean up stored kit data, keeping the latest N entries"
  task :prune, [:number_to_keep] => :environment do |task, args|
    number_to_keep = args.number_to_keep.to_i

    deleted, kept = ColdStorage.prune(number_to_keep)

    puts "Pruned #{deleted} old cold storage #{"entry".pluralize(deleted)}, saving #{kept} #{"entry".pluralize(kept)}."
  end

  desc "Persist current kit data, and delete any old data"
  task update: [ :prune, :freeze ] do
    Rake::Task["cold_storage:prune"].invoke(0)
    Rake::Task["cold_storage:freeze"].invoke
  end

  desc "Persist currnet kit data, delete old kit data, and commit to git"
  task commit: [ :update ] do
    Rake::Task["cold_storage:update"].invoke
    sh "git add #{ColdStorage::Fs::STORAGE_LOCATION}"
    sh "git commit --only #{ColdStorage::Fs::STORAGE_LOCATION} -m 'Update cold storage kit data'"
  end
end
