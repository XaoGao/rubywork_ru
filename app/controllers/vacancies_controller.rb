class VacanciesController < ApplicationController
  before_action :set_user
  before_action :set_vacancy, only: %i[show edit update destroy]

  def index
    @vacancies = Vacancy.all
  end

  def show; end

  def new
    @vacancy = Vacancy.new
  end

  def edit; end

  def create
    @vacancy = @user.vacancies.build(vacancy_params)

    if @vacancy.save
      redirect_to vacancy_path(@vacancy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @vacancy.update(vacancy_params)
      redirect_to vacancy_path(@vacancy)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vacancy.destroy

    redirect_to vacancies_path
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :body)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end
end
