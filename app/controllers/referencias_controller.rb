class ReferenciasController < ApplicationController
  tab :referencias
  
  def index
    @referencias = Referencia.all
  end
  
  def show
    @referencia = Referencia.find(params[:id])
  end
  
  def new
    @referencia = Referencia.new
  end
  
  def create
    @referencia = Referencia.new(params[:referencia])
    if @referencia.save
      flash[:notice] = "Successfully created referencia."
      redirect_to @referencia
    else
      render :action => 'new'
    end
  end
  
  def edit
    @referencia = Referencia.find(params[:id])
  end
  
  def update
    @referencia = Referencia.find(params[:id])
    if @referencia.update_attributes(params[:referencia])
      flash[:notice] = "Successfully updated referencia."
      redirect_to @referencia
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @referencia = Referencia.find(params[:id])
    @referencia.destroy
    flash[:notice] = "Successfully destroyed referencia."
    redirect_to referencias_url
  end
end
