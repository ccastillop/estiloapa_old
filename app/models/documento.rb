class Documento < ActiveRecord::Base
  #attr_accessible :nombre, :ubicacion, :user_id
  belongs_to :user
  has_many :contenidos
  has_many :figuras
  has_and_belongs_to_many :colaboradores, :class_name => "User"   
  validates_presence_of :nombre
  
  def to_s
    nombre
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end
  
  def _old_codigo
    #el nombre es un hexadecimal del id con cinco dígitos de tamaño
    "%06x" % id
  end
  
  def _old_ruta
    "#{RAILS_ROOT}/db/repros/#{codigo}"
  end
  
  #crea el repositorio git
  def after_create
    #creo el directorio
    #git = "#{ruta}/.git"
    #Dir.mkdir(ruta)
    #Dir.mkdir(git)
    #git = Grit::Git.new(ruta)
    #creo el repositorio
    #git.init({})
    #creo el documento raiz
    c = Contenido.new
    c.documento = self
    c.nombre= "==#{self.to_s}=="
    c.save
  end
  
  def _old_repro
    Grit::Repo.new(ruta)
  end
  
  def markdown
    txt = []
    Contenido.each_with_level(contenidos.root.self_and_descendants) do |c, level|
      txt << "#{"#"*(level-1)} #{c.nombre}" if level >1
      txt << "#{"#"*5} #{c.nombre}" if level == 1
      txt << c.texto
    end
    txt.join("\n\n")
  end
  
  def latex
    markdown.pandoku(:markdown, :latex, :toc => true, :number_sections => true)
  end

end
