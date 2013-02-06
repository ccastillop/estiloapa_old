class AddOtrasColumnasDocumento < ActiveRecord::Migration
  def self.up
    add_column :documentos, :caratula, :text
    add_column :documentos, :agradecimientos, :text
    add_column :documentos, :dedicatoria, :text
    add_column :documentos, :resumen, :text
    add_column :documentos, :abstract, :text
    add_column :documentos, :poner_lot, :boolean
    add_column :documentos, :poner_lof, :boolean
  end

  def self.down
    remove_column :documentos, :caratula
    remove_column :documentos, :agradecimientos
    remove_column :documentos, :dedicatoria
    remove_column :documentos, :resumen
    remove_column :documentos, :abstract
    remove_column :documentos, :poner_lot
    remove_column :documentos, :poner_lof
  end
end
