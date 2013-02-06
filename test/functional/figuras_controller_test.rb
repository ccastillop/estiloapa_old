require 'test_helper'

class FigurasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Figura.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Figura.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Figura.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to figura_url(assigns(:figura))
  end
  
  def test_edit
    get :edit, :id => Figura.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Figura.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Figura.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Figura.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Figura.first
    assert_redirected_to figura_url(assigns(:figura))
  end
  
  def test_destroy
    figura = Figura.first
    delete :destroy, :id => figura
    assert_redirected_to figuras_url
    assert !Figura.exists?(figura.id)
  end
end
