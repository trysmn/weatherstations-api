class RemoveTimestampsFromClimatedata < ActiveRecord::Migration[5.2]
  def change
    remove_column :climatedata, :created_at, :string
    remove_column :climatedata, :updated_at, :string
  end
end
