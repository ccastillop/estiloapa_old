module DocumentosHelper
  
  def tabla_contenidos(documento)
    nivel = 1
    txt = []
    txt << content_tag(:li, content_tag(:a, "Lista de tablas", :href => "#lista_de_tablas"), :class => "frontmatter") if documento.poner_lot
    txt << content_tag(:li, content_tag(:a, "Lista de figuras", :href => "#lista_de_figuras"), :class => "frontmatter") if documento.poner_lof
    documento.contenidos.ordenados.each do |contenido|
      if nivel == contenido.level
        #estoy en el mismo nivel
      else
        #cambio de nivel
        if nivel < contenido.level
          #hacia arriba
          txt << "<ul>"*(contenido.level-nivel)
        else
          #hacia abajo
          txt << "</ul>"*(nivel-contenido.level)
        end
        nivel = contenido.level
      end
      txt << content_tag(:li, content_tag(:a, contenido.to_s, :href => "##{contenido.to_param}"), :class => (nivel==1 ? "chapter" : nil))
    end
    #tablas y figuras
    toc = content_tag(:ul, txt.join("\n"), :class => "toc")
  end
  
  def html(documento)
    nivel = 1
    todo = []
    documento.contenidos.ordenados.each do |contenido|
      cap = []
      cap << content_tag("h#{contenido.level}", 
                content_tag(:a, contenido.to_s, :name => contenido.to_param) )
      cap << markdown(contenido.texto)
      todo << content_tag(:div, cap.join("\n"), :id => contenido.to_param )
    end
    todo.join("\n")
  end

  def markdown(text)
    #procesado del texto.
    #existen imágenes
    #text = text.pandoku(:markdown => :html)
    
    #text = (text.blank? ? "" : Maruku.new(text).to_html)
    text = (text.blank? ? "" : BlueCloth::new(text).to_html)
    text.gsub!(/figura_logo_centrum/, image_tag("logo_centrum.png", :alt=>"Centrum Católica", :class=>"logo_centrum"))
    text.gsub!(/figura_([0-9]+)/) do |id|
      begin
        f = Figura.find($1.to_i)
        render_figura(f)
      rescue
        content_tag(:p, "-figura no encontrada-",:class=>:error)
      end
    end
    text
  end
  
  def render_figura(figura)
    content_tag(:div, 
      [ content_tag(:p, image_tag(figura.img.url, :alt => figura ), :class => :art),
        content_tag(:p, figura.nombre, :class => :caption),
        content_tag(:p, figura.descripcion, :class => :nota) ].join("\n"),
      :id => figura,
      :class => "figure"
    )
  end
  
  def lista_de_figuras(documento)
    nivel = 1
    txt = []
    documento.contenidos.ordenados.each do |contenido|
      contenido.texto.gsub(/figura_([0-9]+)/) do |t|
        f = nil
        begin
          f = Figura.find($1.to_i)
        rescue
        end
        if f
          txt << content_tag(:li, content_tag(:a, f.nombre, :href => "##{f}"))
        end
      end
    end
    content_tag(:ol, txt.join("\n"), :class=>"lof")
  end

end
