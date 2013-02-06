class PasswordResetsController < ApplicationController

  before_filter :require_no_user
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]


  def new
    @title = "Recuperar la clave de la cuenta"
    render
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Le hemos enviado instrucciones para restaurar su clave a su correo electrónico. " +
        "Por favor revise su email."
      redirect_to root_url
    else
      flash[:notice] = "No hemos encontrado usuario alguno con este email."
      render :action => :new
    end
  end

  def edit
    @title = "Ingresar la nueva clave de la cuenta"
    render
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "La clave ha sido registrada satisfactoriamente"
      redirect_to root_url
    else
      render :action => :edit
    end
  end

  def show
    redirect_to root_path
  end

  private
    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        flash[:notice] = "Lo sentimos, pero no hemos podido encontrar su cuenta. " +
          "Si persisten los problemas intente copiar y pegar la dirección URL  " +
          "desde el email hacia su navegador de internet para concluir " +
          "con la restauración de la clave."
        redirect_to root_url
      end
    end


end
