class ContenidosController < ApplicationController
  before_filter :require_user
  before_filter :autorizado
  tab :documentos
  layout proc{ |c| c.request.xhr? ? false : "application" }
  
  def index
    @contenidos = @documento.contenidos.all(:order => "lft", :conditions => "parent_id is not null")
  end
  
  def show
    @contenido = Contenido.find(params[:id])
    @contenido.revert_to(params[:version].to_i) if params[:version]
    respond_to do |w|
      w.html{}
      w.js{
        render :partial => "contenido"
      }
    end
  end
  
  def new
    @contenido = Contenido.new
    @contenido.parent_id = params[:parent_id] if params[:parent_id]
  end
  
  def create
    @contenido = Contenido.new(params[:contenido])
    @contenido.documento = @documento
    @contenido.user = current_user
    @parent = Contenido.find params[:parent_id] unless params[:parent_id].blank?
    if @contenido.save
      @contenido.move_to_child_of @parent if @parent
      flash[:notice] = "Successfully created contenido."
      redirect_to [@documento, @contenido]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @contenido = Contenido.find(params[:id])
    
  end
  
  def update
    @contenido = Contenido.find(params[:id])
    @contenido.user = current_user
    @parent = Contenido.find params[:parent_id] unless params[:parent_id].blank?
    @contenido.move_to_child_of @parent if @parent and (@parent != @contenido.parent and @parent != @contenido)
    #@contenido.move_to_root unless @contenido or @contenido.root?
    if @contenido.update_attributes(params[:contenido])
      flash[:notice] = "Successfully updated contenido."
      respond_to do |w|
        w.html {redirect_to [@documento,@contenido]}
        w.js {
          render :update do |page|
            page.replace_html dom_id(@contenido), :partial => 'contenido'
          end
        }
      end
      
    else
      render :action => 'edit'
    end
    
  end
  
  def destroy
    @contenido.destroy
    flash[:notice] = "Successfully destroyed contenido."
    redirect_to documento_contenidos_path(@documento)
  end

  # POST move_higher o right
  def move_right
    if @contenido.right_sibling
      @contenido.move_right
      flash[:notice] = "Moví #{@contenido} hacia abajo"
    else
      flash[:error] = "LLegué al tope"
    end
    redirect_to documento_contenidos_path(@contenido.documento)
  end
  
  # POST move_lower o left
  def move_left
    if @contenido.left_sibling
      @contenido.move_left
      flash[:notice] = "Moví #{@contenido} hacia arriba"
    else
      flash[:error] = "LLegué al final"
    end
    redirect_to documento_contenidos_path(@contenido.documento)
  end
  
  private
    def autorizado
      @contenido = Contenido.find params[:id] if params[:id]
      @documento = Documento.find params[:documento_id] if params[:documento_id]    
      no_autorizado unless current_user.admin or 
          (@documento.present? and @documento.user == current_user) or
          (@contenido.present? and @contenido.documento.user == current_user)
    end

end
