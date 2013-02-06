class CreateContenidos < ActiveRecord::Migration
  def self.up
    create_table :contenidos do |t|
      t.string :nombre
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :documento_id
      t.integer :user_id
      t.text :texto
      t.timestamps
    end
    add_index :contenidos, :parent_id
    add_index :contenidos, :lft
    add_index :contenidos, :rgt
    add_index :contenidos, :documento_id
    add_index :contenidos, :user_id
                
  end
  
  def self.down
    drop_table :contenidos
  end
end
