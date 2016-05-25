class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.references :band
      t.string :name
      t.string :date
      t.string :city
      t.string :venue
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
