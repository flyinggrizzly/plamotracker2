desc "Starts up the application"
task up: :environment do
  Rake::Task["db:migrate"].invoke
  Rake::Task["cold_storage:thaw"].invoke

  exec "bin/dev"
end

namespace :up do
  desc "Starts up the application after installing deps and creating the database"
  task scratch: :environment do
    system "bundle install"
    system "yarn"
    
    Rake::Task["db:create"].invoke
    Rake::Task["db:schema:load"].invoke

    Rake::Task[:up].invoke
  end

  namespace :scratch do
    desc "Starts up the application after installing deps, dropping the database, recreating it, and reseeding data"
    task reset: :environment do
      system "bundle install"
      system "yarn"

      Rake::Task["db:drop"].invoke

      Rake::Task["db:create"].invoke
      Rake::Task["db:schema:load"].invoke

      Rake::Task[:up].invoke
    end
  end
end
