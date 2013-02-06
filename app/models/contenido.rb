class Contenido < ActiveRecord::Base
  attr_accessible :nombre, :parent_id, :lft, :rgt, :documento_id, :user_id, :texto
  acts_as_nested_set
  versioned
  validates_presence_of :nombre
  belongs_to :documento
  belongs_to :user
  named_scope :ordenados, :conditions=>"parent_id is not null", :order=>"lft"

  def to_param
    "#{id}-#{to_s.parameterize}"
  end

  def to_s
    nombre
  end
  
  #Crear archivo plano
  def after_create
    #repro = documento.repro
    #creo el archivo en el repositorio
    #file = File.new("#{documento.ruta}/#{to_param}","w")
    #file.write texto
    #file.save
    #agrego el archivo al repro
    #repro.
  end
  #Modificar archivo
  def after_update
    
  end
  
  def self.per_page
    15
  end
  
end
