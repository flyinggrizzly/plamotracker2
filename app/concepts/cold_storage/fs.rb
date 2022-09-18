module ColdStorage
  module Fs
    extend(self)

    STORAGE_LOCATION = "cold_storage"

    def write(name, data)
      path = todays_folder.join("#{name}__#{DateTime.current.iso8601}.json")

      File.write(path, JSON.pretty_generate(data))

      path
    end

    def read_latest(name)
      JSON.load_file(latest_file(name))
    end

    private

    def todays_folder
      Dir.mkdir(serialized_data_repository_path) unless Dir.exist?(serialized_data_repository_path)

      date_dir = serialized_data_repository_path.join(Date.current.iso8601)

      Dir.mkdir(date_dir) unless Dir.exist?(date_dir)

      date_dir
    end

    def latest_file(prefix)
      latest_folder.children.filter {|e|
        filename = e.split.last.to_s

        filename.start_with?("#{prefix}__")
      }
        .max
    end

    def latest_folder
      serialized_data_repository_path.children.max
    end

    def serialized_data_repository_path
      Rails.root.join(STORAGE_LOCATION)
    end
  end
end
