require 'test_helper'

class ReferenciasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Referencia.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Referencia.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Referencia.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to referencia_url(assigns(:referencia))
  end
  
  def test_edit
    get :edit, :id => Referencia.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Referencia.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Referencia.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Referencia.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Referencia.first
    assert_redirected_to referencia_url(assigns(:referencia))
  end
  
  def test_destroy
    referencia = Referencia.first
    delete :destroy, :id => referencia
    assert_redirected_to referencias_url
    assert !Referencia.exists?(referencia.id)
  end
end
