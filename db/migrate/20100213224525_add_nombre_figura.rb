class AddNombreFigura < ActiveRecord::Migration
  def self.up
    add_column :figuras, :nombre, :string
  end

  def self.down
    remove_column :figuras, :nombre
  end
end
