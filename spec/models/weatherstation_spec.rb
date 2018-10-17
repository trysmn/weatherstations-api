require 'rails_helper'

# Test suite for the Weatherstation model
RSpec.describe Weatherstation, type: :model do

  # Association test
  # ensure Weatherstation model has a one:many relationship with the Climatedata model:
  it { should have_many(:climatedatas).dependent(:destroy) }

  # Validation tests
  # ensure that the name column is present before saving:
  it { should validate_presence_of(:name) }

end
