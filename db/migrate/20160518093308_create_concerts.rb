class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.references :band
      t.string :name
      t.string :date
      t.string :place_name
      t.string :place_location
      t.timestamps null: false
    end
  end
end
