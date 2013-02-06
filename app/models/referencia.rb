class Referencia < ActiveRecord::Base
  attr_accessible :nombre, :autor, :fecha, :titulo_articulo, :titulo_libro_revista_periodico, :volumen, :paginas, :libre1, :libre2, :edicion, :ubicacion, :editorial, :fecha_web, :direccion_web, :descripcion
  validates_presence_of :nombre, :autor, :fecha, :titulo_libro_revista_periodico
  belongs_to :user_id
  belongs_to :documento_id
end
