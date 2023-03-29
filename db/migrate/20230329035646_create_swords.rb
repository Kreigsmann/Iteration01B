class CreateSwords < ActiveRecord::Migration[6.1]
  def change
    create_table :swords do |t|
      t.string :type
      t.integer :subtype
      t.string :pommel
      t.string :grip
      t.string :steel
      t.text :description

      t.timestamps
    end
  end
end
