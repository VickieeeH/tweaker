require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "#index" do
    it "should assign all the projects" do
      projects = Project.create
      get :index
      expect(assigns(:projects)).to eq [projects]
    end
  end

  describe "#new" do
    it "should assign a new project" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "#create" do
    it "should assign a new project" do
      post :create, {project: {title: "DNZ", description: "Project description"}}
      expect(assigns(:project)).to be_a(Project)
    end

    it "should make a new project with the right params" do
    end

    it "should save a project" do
      Project.any_instance.stub(:id).and_return(1)
      expect_any_instance_of(Project).to receive(:save)
      post :create, {project: {title: "DNZ", description: "Project description"}}
    end
  end
end
