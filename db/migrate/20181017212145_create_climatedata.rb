class CreateClimatedata < ActiveRecord::Migration[5.2]
  def change
    create_table :climatedata do |t|
      t.float :max_temp
      t.float :min_temp
      t.float :mean_temp
      t.float :total_rainfall
      t.float :total_sunshine
      t.integer :month
      t.integer :year
      t.references :weatherstation, foreign_key: true

      t.timestamps
    end
  end
end
