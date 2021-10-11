class App < ApplicationRecord
  belongs_to :owner

  enum critical_level: { low: 0, medium: 1, high: 2, very_high: 3 }

  has_many :cloud_stacks
end
