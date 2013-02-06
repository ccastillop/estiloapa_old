class FijasController < ApplicationController
  tab :home
  def show
    render :action => params[:path]
  end
end