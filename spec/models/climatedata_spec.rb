require 'rails_helper'

# Test suite for the Climatedata model
RSpec.describe Climatedata, type: :model do

  # Association test
  # ensure a Climatedata record belongs to a single Weatherstation record:
  it { should belong_to(:weatherstation) }

  # Validation test
  # ensure that the max_temp, min_temp, mean_temp, total_rainfall, total_sunshine, month and year columns are present before saving:
  it { should validate_presence_of(:max_temp) }
  it { should validate_presence_of(:min_temp) }
  it { should validate_presence_of(:mean_temp) }
  it { should validate_presence_of(:total_rainfall) }
  it { should validate_presence_of(:total_sunshine) }
  it { should validate_presence_of(:month) }
  it { should validate_presence_of(:year) }

end
