class CreateReferencias < ActiveRecord::Migration
  def self.up
    create_table :referencias do |t|
      t.string :nombre
      t.string :autor
      t.string :fecha
      t.string :titulo_articulo
      t.string :titulo_libro_revista_periodico
      t.string :volumen
      t.string :paginas
      t.string :libre1
      t.string :libre2
      t.string :edicion
      t.string :ubicacion
      t.string :editorial
      t.string :fecha_web
      t.string :direccion_web
      t.string :descripcion
      t.integer :user_id
      t.integer :documento_id
      t.timestamps
    end
    add_index :referencias, :user_id
    add_index :referencias, :documento_id
  end
  
  def self.down
    drop_table :referencias
  end
end
