class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :image
      t.string :description
      
      t.timestamps null: false
    end
  end
end
