class CreateDocumentosUsers < ActiveRecord::Migration
  def self.up
    create_table :documentos_users, :force => true, :id => false do |t|
      t.integer :documento_id
      t.integer :user_id
      t.timestamps
    end
    add_index :documentos_users, [:documento_id, :user_id], :unique => true
  end

  def self.down
    drop_table :documentos_users
  end
end
