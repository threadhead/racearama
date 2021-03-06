require File.dirname(__FILE__) + '/../spec_helper'
 
# describe PacksController do
#   fixtures :all
#   render_views
#   
#   before(:each) do
#     Factory(:pack)
#   end
#   
#   
#   it "index action should render index template" do
#     get :index
#     response.should render_template(:index)
#   end
#   
#   it "show action should render show template" do
#     get :show, :id => Pack.first
#     response.should render_template(:show)
#   end
#     
#   it "new action should render new template" do
#     get :new
#     response.should render_template(:new)
#   end
#   
#   it "create action should render new template when model is invalid" do
#     Pack.any_instance.stubs(:valid?).returns(false)
#     post :create
#     response.should render_template(:new)
#   end
#   
#   it "create action should redirect when model is valid" do
#     Pack.any_instance.stubs(:valid?).returns(true)
#     post :create
#     response.should redirect_to(pack_url(assigns[:pack]))
#   end
#   
#   it "edit action should render edit template" do
#     get :edit, :id => Pack.first
#     response.should render_template(:edit)
#   end
#   
#   it "update action should render edit template when model is invalid" do
#     Pack.any_instance.stubs(:valid?).returns(false)
#     put :update, :id => Pack.first
#     response.should render_template(:edit)
#   end
#   
#   it "update action should redirect when model is valid" do
#     Pack.any_instance.stubs(:valid?).returns(true)
#     put :update, :id => Pack.first
#     response.should redirect_to(pack_url(assigns[:pack]))
#   end
#   
#   it "destroy action should destroy model and redirect to index action" do
#     pack = Pack.first
#     delete :destroy, :id => pack
#     response.should redirect_to(packs_url)
#     Pack.exists?(pack.id).should be_false
#   end
# end
