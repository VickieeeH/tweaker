class JobsController < ApplicationController
  before_action :get_project

  def index
    @jobs = @project&.jobs
  end

  def show
    @job = @project.jobs.find(params[:id])
  end

  def new
    @job = @project.jobs.build
  end

  def create
    @job = @project.jobs.build(job_params)
    if @job.save
      redirect_to project_jobs_path(@project.id)
    else
      render action: "new"
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def get_project
    @project = Project.find_by_id(params[:project_id])
  end
end
