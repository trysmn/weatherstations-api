class RemoveTimestampsFromWeatherstation < ActiveRecord::Migration[5.2]
  def change
    remove_column :weatherstations, :created_at, :string
    remove_column :weatherstations, :updated_at, :string
  end
end
