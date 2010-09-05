require File.dirname(__FILE__) + '/../spec_helper'
 
describe ScoutsController do
  fixtures :all
  render_views
  
  before(:each) do
    pack = Factory(:pack)
    den = Factory(:den, :pack => pack)
    @scout = Factory(:scout, :den => den)
  end
  
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
it "show action should render show template" do
    get :show, :id => Scout.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Scout.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Scout.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(scout_url(assigns[:scout]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Scout.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Scout.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Scout.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Scout.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Scout.first
    response.should redirect_to(scout_url(assigns[:scout]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    scout = Scout.first
    delete :destroy, :id => scout
    response.should redirect_to(scouts_url)
    Scout.exists?(scout.id).should be_false
  end
end
