class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :get_user, :only => [:show, :edit, :update]
  before_filter :autorizado, :only => [:show, :edit, :update]
  tab :signup
  
  def index
    #@users = User.paginate(:order=>"id desc", :page => params[:page])
    parametros = [:email, :nombre] #otros campos de las tablas...
    
    @palabras = params[:palabras]
    @palabras ||= "---"
    @palabras = @palabras.split
    condicion = []
    @palabras.each do |p|
      parametros.each do |pr|
        condicion << "users.#{pr.to_s} like '%#{p}%'"
      end
    end
    @palabras = @palabras.join(" ")
    @users = User.paginate(:order=>"users.id desc",
        :conditions => condicion.join(" OR "),
        #:include => :clientes, otras tablas
        :page => params[:page])
        
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registro exitoso. Bienvenido"
      redirect_back_or_default @user
    else
      render :action => :new
    end
  end
  
  def show
  end
 
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Su registro ha sido actualizado correctamente"
      redirect_to @user
    else
      render :action => :edit
    end
  end
  
  private
    def get_user
      @user = User.find params[:id] if params[:id]
      @user ||= current_user
    end
    #autorizo acceso a los datos si el usuario es admin o el mismo usuario
    def autorizado
      no_autorizado unless current_user == @user or current_user.admin
    end
  
end
