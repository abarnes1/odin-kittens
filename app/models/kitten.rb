class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { in: 0..30 }
  validates :softness, :cuteness, numericality: { in: 1..10 }
end