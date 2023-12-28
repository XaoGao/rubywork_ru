class ResumesController < ApplicationController
  before_action :authenticate_user!, only: %i[new]

  def index
    @resumes = Resume.page(params[:page]).per(15)
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def new
    @resume = Resume.new
    authorize! @resume, with: ResumePolicy
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save
      redirect_to @resume, notice: t(".created")
    else
      render :new, alert: @resume.errors.full_messages.join(" ")
    end
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to @resume, notice: t(".updated")
    else
      render :edit, alert: @resume.errors.full_messages.join(" ")
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to root_path, notice: t(".deleted")
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :description, :user_id)
  end
end
