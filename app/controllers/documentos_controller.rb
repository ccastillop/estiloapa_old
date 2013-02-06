class DocumentosController < ApplicationController
  before_filter :require_user
  before_filter :get_user
  before_filter :autorizado
  tab :documentos
  
  def index
    @documentos = @user.documentos
  end
  
  def show
    page = params[:page]
    page ||= 1
    @documento = @user.documentos.find(params[:id])
    respond_to do |w|
      w.html{
        #@contenidos = @documento.contenidos.paginate(
        #    :page => page,
        #    :conditions=>"parent_id is not null",
        #    :order=>"lft")
        @contenidos = @documento.contenidos.ordenados
      }
      w.text{
      }
      w.latex{
        render :text => Iconv.conv( 'utf-8', 'ISO-8859-1', @documento.latex)
      }
      w.markdown{
        render :text => @documento.markdown
      }
      w.pdf{
        render :pdf => @documento.to_s.parameterize, :stylesheets => ["pdf/apa"], :layout => false
      }
    end
  end
  
  def new
    @documento = Documento.new
    #carátula de tesis por defecto
    caratula_ejemplo = <<texto
PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ

ESCUELA DE GRADUADOS

figura_logo_centrum

TESIS PARA OBTENER EL GRADO DE MAGÍSTER EN

ADMINISTRACIÓN DE NEGOCIOS

OTORGADO POR LA 

PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ

# TITULO DE LA TESIS

## PRESENTADA POR
### Sr. Juán Perez
### Sra. Juana Perez

#### Asesor: Profesor Juanito Perez

Surco, mes del año

texto

    @documento.caratula = caratula_ejemplo
    
  end
  
  def create
    @documento = Documento.new(params[:documento])
    @documento.user = @user
    if @documento.save
      flash[:notice] = "Successfully created documento."
      redirect_to [@user, @documento]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @documento = Documento.find(params[:id])
  end
  
  def update
    @documento = Documento.find(params[:id])
    if @documento.update_attributes(params[:documento])
      flash[:notice] = "Successfully updated documento."
      redirect_to [@user,@documento]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @documento = Documento.find(params[:id])
    @documento.destroy
    flash[:notice] = "Successfully destroyed documento."
    redirect_to user_documentos_url(@user)
  end
  
  private
    def get_user
      @user = User.find params[:user_id]
    end
    def autorizado
      no_autorizado unless current_user == @user or current_user.admin
    end
end
