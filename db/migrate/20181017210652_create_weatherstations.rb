class CreateWeatherstations < ActiveRecord::Migration[5.2]
  def change
    create_table :weatherstations do |t|
      t.string :name

      t.timestamps
    end
  end
end
