namespace :cold_storage do
  desc "Persist kits to JSON, using stable identifiers to anchor associations"
  task freeze: :environment do
    outpath = ColdStorage.freeze

    puts "Saved all kit data to #{outpath}"
  end

  desc "Loads kit data from JSON"
  task thaw: :environment do
    kit_counts, instance_counts = ColdStorage.thaw
    starting_kits, starting_kit_instances = kit_counts
    ending_kits, ending_kit_instances = instance_counts

    created_kits = ending_kits - starting_kits
    created_instances = ending_kit_instances - starting_kit_instances

    puts "#{ending_kits} #{"kit".pluralize(ending_kits)} ready (created #{created_kits} #{"kit".pluralize(created_kits)})"
    puts "#{ending_kit_instances} kit #{"box".pluralize(ending_kit_instances)} ready (created #{created_instances} kit #{"box".pluralize(created_instances)})"
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

  desc "Commits cold_storage submodule and updates ref"
  task commit: :environment do
    current_dir = Dir.getwd

    Dir.chdir(ColdStorage::Fs::STORAGE_LOCATION)
    system!('git add .')
    system!('git commit -m "Update cold_storage"')
    system!('git push origin HEAD:main')

    Dir.chdir(current_dir)
    system!('git add cold_storage')
    system!('git commmit -only cold_storage -m "Update cold_storage refs"')
    system!('git push')
  end
end

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end
