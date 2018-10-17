class Climatedata < ApplicationRecord
  # model association
  belongs_to :weatherstation

  # validations
  validates_presence_of :min_temp, :max_temp, :mean_temp, :total_rainfall, :total_sunshine, :month, :year
end
