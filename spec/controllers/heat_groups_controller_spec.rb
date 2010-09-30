require 'spec_helper'

describe HeatGroupsController do

  def mock_heat_group(stubs={})
    @mock_heat_group ||= mock_model(HeatGroup, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all heat_groups as @heat_groups" do
      HeatGroup.stub(:all) { [mock_heat_group] }
      get :index
      assigns(:heat_groups).should eq([mock_heat_group])
    end
  end

  describe "GET show" do
    it "assigns the requested heat_group as @heat_group" do
      HeatGroup.stub(:find).with("37") { mock_heat_group }
      get :show, :id => "37"
      assigns(:heat_group).should be(mock_heat_group)
    end
  end

  describe "GET new" do
    it "assigns a new heat_group as @heat_group" do
      HeatGroup.stub(:new) { mock_heat_group }
      get :new
      assigns(:heat_group).should be(mock_heat_group)
    end
  end

  describe "GET edit" do
    it "assigns the requested heat_group as @heat_group" do
      HeatGroup.stub(:find).with("37") { mock_heat_group }
      get :edit, :id => "37"
      assigns(:heat_group).should be(mock_heat_group)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created heat_group as @heat_group" do
        HeatGroup.stub(:new).with({'these' => 'params'}) { mock_heat_group(:save => true) }
        post :create, :heat_group => {'these' => 'params'}
        assigns(:heat_group).should be(mock_heat_group)
      end

      it "redirects to the created heat_group" do
        HeatGroup.stub(:new) { mock_heat_group(:save => true) }
        post :create, :heat_group => {}
        response.should redirect_to(heat_group_url(mock_heat_group))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved heat_group as @heat_group" do
        HeatGroup.stub(:new).with({'these' => 'params'}) { mock_heat_group(:save => false) }
        post :create, :heat_group => {'these' => 'params'}
        assigns(:heat_group).should be(mock_heat_group)
      end

      it "re-renders the 'new' template" do
        HeatGroup.stub(:new) { mock_heat_group(:save => false) }
        post :create, :heat_group => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested heat_group" do
        HeatGroup.should_receive(:find).with("37") { mock_heat_group }
        mock_heat_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :heat_group => {'these' => 'params'}
      end

      it "assigns the requested heat_group as @heat_group" do
        HeatGroup.stub(:find) { mock_heat_group(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:heat_group).should be(mock_heat_group)
      end

      it "redirects to the heat_group" do
        HeatGroup.stub(:find) { mock_heat_group(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(heat_group_url(mock_heat_group))
      end
    end

    describe "with invalid params" do
      it "assigns the heat_group as @heat_group" do
        HeatGroup.stub(:find) { mock_heat_group(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:heat_group).should be(mock_heat_group)
      end

      it "re-renders the 'edit' template" do
        HeatGroup.stub(:find) { mock_heat_group(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested heat_group" do
      HeatGroup.should_receive(:find).with("37") { mock_heat_group }
      mock_heat_group.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the heat_groups list" do
      HeatGroup.stub(:find) { mock_heat_group }
      delete :destroy, :id => "1"
      response.should redirect_to(heat_groups_url)
    end
  end

end
