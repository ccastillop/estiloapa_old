require 'test_helper'

class DocumentosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Documento.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Documento.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Documento.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to documento_url(assigns(:documento))
  end
  
  def test_edit
    get :edit, :id => Documento.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Documento.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Documento.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Documento.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Documento.first
    assert_redirected_to documento_url(assigns(:documento))
  end
  
  def test_destroy
    documento = Documento.first
    delete :destroy, :id => documento
    assert_redirected_to documentos_url
    assert !Documento.exists?(documento.id)
  end
end
