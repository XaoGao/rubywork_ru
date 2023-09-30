class ResumesController < ApplicationController
  def show
    @resume = Resume.find(params[:id])
    authorize! @resume
  end

  def new
    @resume = Resume.new
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save?
      redirect_to @resume, notice: t(".created")
    else
      render :new, alert: resume.errors.full_messages.join(' ')
    end
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to @resume, notice: t(".updated")
    else
      render :edit, alert: @resume.errors.full_messages.join(' ')
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to root_path, notice: t(".deleted")
  end

  private

  def resume_params
    params.require(:resume).permit(:description)
  end
end
