module FactTable
  module Table
    def persist!
      build.map {|identifier, record| record.save!}
    end
  end
end
