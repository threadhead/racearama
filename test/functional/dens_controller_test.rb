require 'test_helper'

class DensControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Den.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Den.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Den.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to den_url(assigns(:den))
  end
  
  def test_edit
    get :edit, :id => Den.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Den.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Den.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Den.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Den.first
    assert_redirected_to den_url(assigns(:den))
  end
  
  def test_destroy
    den = Den.first
    delete :destroy, :id => den
    assert_redirected_to dens_url
    assert !Den.exists?(den.id)
  end
end
