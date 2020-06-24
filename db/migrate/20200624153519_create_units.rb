class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :dwelling_type
      t.integer :floor_area
      t.integer :number_of_dwellings
      t.integer :price_per_unit_area
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
