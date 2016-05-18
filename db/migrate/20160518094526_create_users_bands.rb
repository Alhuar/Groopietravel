class CreateUsersBands < ActiveRecord::Migration
  def change
    create_table :users_bands do |t|
      t.belongs_to :user, index: true
      t.belongs_to :concert, index: true
      t.boolean :is_favorite, default: false	
      t.timestamps null: false
    end
  end
end
