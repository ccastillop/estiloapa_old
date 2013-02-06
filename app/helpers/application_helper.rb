# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Replacement for Rails' default Markdown helper which uses Maruku instead
  # of BlueCloth.
  def markdown(text)
    text.blank? ? "" : Maruku.new(text).to_html
  end
  
  # para mostrar verdadero o falso
  def ticker(valor)
    return image_tag "icons/tick.png", :title => "sí" if valor
    return image_tag "icons/cross.png", :title => "no" unless valor
  end
  
  # truncar los párrafos a 30 caracteres
  def truncate_words(text, length = 14, end_string = ' …')
    return if text.nil?
    text = strip_tags text
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

  # para el link de show
  def link_to_show(objeto)
    link_to image_tag("icons/eye.png", :alt => "revisar objeto"), 
      objeto, :title => "Mostrar objeto"
  end
  
  # para el link de edit
  def link_to_edit(objeto)
    link_to image_tag("icons/pencil.png", :alt => "editar objeto"), 
      edit_polymorphic_path(objeto), :title => "Modificar objeto"
  end
  
  # para el link de eliminar
  def link_to_destroy(objeto)
    link_to image_tag("icons/delete.png", :alt => "eliminar objeto"), 
      objeto, :method => :delete, :title => "Destruir objeto", 
      :confirm => 'Eliminaré el registro. ¿Estás segur@?'
  end

end
