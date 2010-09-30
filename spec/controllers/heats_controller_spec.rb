require 'spec_helper'

describe HeatsController do

  def mock_heat(stubs={})
    @mock_heat ||= mock_model(Heat, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all heats as @heats" do
      Heat.stub(:all) { [mock_heat] }
      get :index
      assigns(:heats).should eq([mock_heat])
    end
  end

  describe "GET show" do
    it "assigns the requested heat as @heat" do
      Heat.stub(:find).with("37") { mock_heat }
      get :show, :id => "37"
      assigns(:heat).should be(mock_heat)
    end
  end

  describe "GET new" do
    it "assigns a new heat as @heat" do
      Heat.stub(:new) { mock_heat }
      get :new
      assigns(:heat).should be(mock_heat)
    end
  end

  describe "GET edit" do
    it "assigns the requested heat as @heat" do
      Heat.stub(:find).with("37") { mock_heat }
      get :edit, :id => "37"
      assigns(:heat).should be(mock_heat)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created heat as @heat" do
        Heat.stub(:new).with({'these' => 'params'}) { mock_heat(:save => true) }
        post :create, :heat => {'these' => 'params'}
        assigns(:heat).should be(mock_heat)
      end

      it "redirects to the created heat" do
        Heat.stub(:new) { mock_heat(:save => true) }
        post :create, :heat => {}
        response.should redirect_to(heat_url(mock_heat))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved heat as @heat" do
        Heat.stub(:new).with({'these' => 'params'}) { mock_heat(:save => false) }
        post :create, :heat => {'these' => 'params'}
        assigns(:heat).should be(mock_heat)
      end

      it "re-renders the 'new' template" do
        Heat.stub(:new) { mock_heat(:save => false) }
        post :create, :heat => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested heat" do
        Heat.should_receive(:find).with("37") { mock_heat }
        mock_heat.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :heat => {'these' => 'params'}
      end

      it "assigns the requested heat as @heat" do
        Heat.stub(:find) { mock_heat(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:heat).should be(mock_heat)
      end

      it "redirects to the heat" do
        Heat.stub(:find) { mock_heat(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(heat_url(mock_heat))
      end
    end

    describe "with invalid params" do
      it "assigns the heat as @heat" do
        Heat.stub(:find) { mock_heat(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:heat).should be(mock_heat)
      end

      it "re-renders the 'edit' template" do
        Heat.stub(:find) { mock_heat(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested heat" do
      Heat.should_receive(:find).with("37") { mock_heat }
      mock_heat.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the heats list" do
      Heat.stub(:find) { mock_heat }
      delete :destroy, :id => "1"
      response.should redirect_to(heats_url)
    end
  end

end
