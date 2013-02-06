class FigurasController < ApplicationController
  layout false

  before_filter :require_user
  before_filter :get_documento
  before_filter :autorizado
  
  def index
    @figuras = @documento.figuras
  end
  
  def show
    @figura = Figura.find(params[:id])
  end
  
  def new
    @figura = Figura.new
  end
  
  def create
    @figura = Figura.new(params[:figura])
    @figura.user = current_user
    @figura.documento = @documento
    if @figura.save
      flash[:notice] = "Successfully created figura."
      redirect_to [@documento,@figura]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @figura = Figura.find(params[:id])
  end
  
  def update
    @figura = Figura.find(params[:id])
    if @figura.update_attributes(params[:figura])
      flash[:notice] = "Successfully updated figura."
      redirect_to [@documento,@figura]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @figura = Figura.find(params[:id])
    @figura.destroy
    flash[:notice] = "Successfully destroyed figura."
    redirect_to documento_figuras_url(@documento)
  end

  private
    def get_documento
      @documento = Documento.find(params[:documento_id])
    end
    def autorizado
      no_autorizado unless current_user == @user or current_user.admin
    end  
  
end
