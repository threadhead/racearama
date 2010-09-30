require 'spec_helper'

describe "heats/edit.html.haml" do
  before(:each) do
    @heat = assign(:heat, stub_model(Heat,
      :new_record? => false,
      :heat_group_id => 1,
      :heat_number => 1
    ))
  end

  it "renders the edit heat form" do
    render

    rendered.should have_selector("form", :action => heat_path(@heat), :method => "post") do |form|
      form.should have_selector("input#heat_heat_group_id", :name => "heat[heat_group_id]")
      form.should have_selector("input#heat_heat_number", :name => "heat[heat_number]")
    end
  end
end
