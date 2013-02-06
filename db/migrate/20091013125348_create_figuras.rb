class CreateFiguras < ActiveRecord::Migration
  def self.up
    create_table :figuras do |t|
      t.integer :numero
      t.text :descripcion
      t.integer :orden
      t.string :img_file_name
      t.string :img_content_type
      t.integer :img_file_size
      t.integer :user_id
      t.integer :documento_id
      t.timestamps
    end
    add_index :figuras, :user_id
    add_index :figuras, :documento_id
  end
  
  def self.down
    drop_table :figuras
  end
end
