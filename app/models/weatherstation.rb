class Weatherstation < ApplicationRecord
  # model association
  has_many :climatedatas, dependent: :destroy

  # validation
  validates_presence_of :name
end
