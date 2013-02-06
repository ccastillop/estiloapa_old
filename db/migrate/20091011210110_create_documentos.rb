class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|
      t.string :nombre
      t.string :ubicacion
      t.integer :user_id
      t.timestamps
    end
    add_index :documentos, :user_id
  end
  
  def self.down
    drop_table :documentos
  end
end
