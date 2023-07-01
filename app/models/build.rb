class Build < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  enum :status, {
    ideating: 0,
    planned: 1,
    in_progress: 100,
    complete: 200,
    abandoned: 300,
  }
end
