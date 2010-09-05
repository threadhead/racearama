require 'test_helper'

class PacksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Pack.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Pack.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Pack.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pack_url(assigns(:pack))
  end
  
  def test_edit
    get :edit, :id => Pack.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Pack.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pack.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Pack.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pack.first
    assert_redirected_to pack_url(assigns(:pack))
  end
  
  def test_destroy
    pack = Pack.first
    delete :destroy, :id => pack
    assert_redirected_to packs_url
    assert !Pack.exists?(pack.id)
  end
end
