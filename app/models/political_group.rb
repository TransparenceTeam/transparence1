class PoliticalGroup < ApplicationRecord
  validates :ref, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :deputies
  has_many :politicians
end
