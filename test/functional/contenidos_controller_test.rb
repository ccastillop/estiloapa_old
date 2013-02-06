require 'test_helper'

class ContenidosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Contenido.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Contenido.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Contenido.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to contenido_url(assigns(:contenido))
  end
  
  def test_edit
    get :edit, :id => Contenido.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Contenido.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Contenido.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Contenido.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Contenido.first
    assert_redirected_to contenido_url(assigns(:contenido))
  end
  
  def test_destroy
    contenido = Contenido.first
    delete :destroy, :id => contenido
    assert_redirected_to contenidos_url
    assert !Contenido.exists?(contenido.id)
  end
end
