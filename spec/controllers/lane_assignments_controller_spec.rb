# require 'spec_helper'
# 
# describe LaneAssignmentsController do
# 
#   def mock_lane_assignment(stubs={})
#     @mock_lane_assignment ||= mock_model(LaneAssignment, stubs).as_null_object
#   end
# 
#   describe "GET index" do
#     it "assigns all lane_assignments as @lane_assignments" do
#       LaneAssignment.stub(:all) { [mock_lane_assignment] }
#       get :index
#       assigns(:lane_assignments).should eq([mock_lane_assignment])
#     end
#   end
# 
#   describe "GET show" do
#     it "assigns the requested lane_assignment as @lane_assignment" do
#       LaneAssignment.stub(:find).with("37") { mock_lane_assignment }
#       get :show, :id => "37"
#       assigns(:lane_assignment).should be(mock_lane_assignment)
#     end
#   end
# 
#   describe "GET new" do
#     it "assigns a new lane_assignment as @lane_assignment" do
#       LaneAssignment.stub(:new) { mock_lane_assignment }
#       get :new
#       assigns(:lane_assignment).should be(mock_lane_assignment)
#     end
#   end
# 
#   describe "GET edit" do
#     it "assigns the requested lane_assignment as @lane_assignment" do
#       LaneAssignment.stub(:find).with("37") { mock_lane_assignment }
#       get :edit, :id => "37"
#       assigns(:lane_assignment).should be(mock_lane_assignment)
#     end
#   end
# 
#   describe "POST create" do
# 
#     describe "with valid params" do
#       it "assigns a newly created lane_assignment as @lane_assignment" do
#         LaneAssignment.stub(:new).with({'these' => 'params'}) { mock_lane_assignment(:save => true) }
#         post :create, :lane_assignment => {'these' => 'params'}
#         assigns(:lane_assignment).should be(mock_lane_assignment)
#       end
# 
#       it "redirects to the created lane_assignment" do
#         LaneAssignment.stub(:new) { mock_lane_assignment(:save => true) }
#         post :create, :lane_assignment => {}
#         response.should redirect_to(lane_assignment_url(mock_lane_assignment))
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved lane_assignment as @lane_assignment" do
#         LaneAssignment.stub(:new).with({'these' => 'params'}) { mock_lane_assignment(:save => false) }
#         post :create, :lane_assignment => {'these' => 'params'}
#         assigns(:lane_assignment).should be(mock_lane_assignment)
#       end
# 
#       it "re-renders the 'new' template" do
#         LaneAssignment.stub(:new) { mock_lane_assignment(:save => false) }
#         post :create, :lane_assignment => {}
#         response.should render_template("new")
#       end
#     end
# 
#   end
# 
#   describe "PUT update" do
# 
#     describe "with valid params" do
#       it "updates the requested lane_assignment" do
#         LaneAssignment.should_receive(:find).with("37") { mock_lane_assignment }
#         mock_lane_assignment.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, :id => "37", :lane_assignment => {'these' => 'params'}
#       end
# 
#       it "assigns the requested lane_assignment as @lane_assignment" do
#         LaneAssignment.stub(:find) { mock_lane_assignment(:update_attributes => true) }
#         put :update, :id => "1"
#         assigns(:lane_assignment).should be(mock_lane_assignment)
#       end
# 
#       it "redirects to the lane_assignment" do
#         LaneAssignment.stub(:find) { mock_lane_assignment(:update_attributes => true) }
#         put :update, :id => "1"
#         response.should redirect_to(lane_assignment_url(mock_lane_assignment))
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns the lane_assignment as @lane_assignment" do
#         LaneAssignment.stub(:find) { mock_lane_assignment(:update_attributes => false) }
#         put :update, :id => "1"
#         assigns(:lane_assignment).should be(mock_lane_assignment)
#       end
# 
#       it "re-renders the 'edit' template" do
#         LaneAssignment.stub(:find) { mock_lane_assignment(:update_attributes => false) }
#         put :update, :id => "1"
#         response.should render_template("edit")
#       end
#     end
# 
#   end
# 
#   describe "DELETE destroy" do
#     it "destroys the requested lane_assignment" do
#       LaneAssignment.should_receive(:find).with("37") { mock_lane_assignment }
#       mock_lane_assignment.should_receive(:destroy)
#       delete :destroy, :id => "37"
#     end
# 
#     it "redirects to the lane_assignments list" do
#       LaneAssignment.stub(:find) { mock_lane_assignment }
#       delete :destroy, :id => "1"
#       response.should redirect_to(lane_assignments_url)
#     end
#   end
# 
# end
