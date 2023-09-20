class ResumesController < ApplicationController
  def new
    @resume = Resume.new
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save?
      redirect_to @resume, notice: 'Resume successfully created'
    else
      render :new, alert: resume.errors.full_messages.join(' ')
    end
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume was successfully updated'
    else
      render :edit, alert: @resume.errors.full_messages.join(' ')
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to root_path, notice: 'Resume was successfully deleted'
  end

  private

  def resume_params
    params.require(:resume).permit(:description)
  end
end
