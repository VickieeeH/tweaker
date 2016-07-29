require 'rails_helper'
require 'spec_helper'

RSpec.describe JobsController, type: :controller do

  describe 'GET #show' do
    let(:job) { FactoryGirl.create(:job) }

    it 'assign the jobs to @project' do
      get :show, project_id: job.project.id, id: job.id
      expect(assigns(:job)).to eq job
    end
  end

  describe 'GET #new' do
    let(:job) { FactoryGirl.create(:job) }

    it 'builds a job' do
      get :new, project_id: job.project.id
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe 'POST #create' do
    let(:project) { FactoryGirl.create(:project) }

    it 'create a new job' do
      post :create, project_id: project.id, job: { title: 'Foo', description: 'Quxx'}
      expect(assigns(:project)).to eq project
    end

    it 'create a new job' do
      post :create, project_id: project.id, job: { title: 'Foo', description: 'Quxx'}
      expect(Job.last.title).to eq 'Foo'
    end

    it 'redirects to project_jobs_path' do
      post :create, project_id: project.id, job: { title: 'Foo', description: 'Quxx'}
      expect(:response).to redirect_to project_jobs_path(assigns[:project])
    end

  end

end
