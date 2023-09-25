class VacanciesController < ApplicationController
  before_action :load_vacancy, only: %i[edit update destroy]
  verify_authorized only: %i[edit update destroy]

  def index
    @vacancies = Vacancy.all
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
  end

  def edit; end

  def create
    @vacancy = current_user.vacancies.build(vacancy_params)

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

  def load_vacancy
    @vacancy = Vacancy.find(params[:id])
    authorize!(@vacancy)
  end

  def vacancy_params
    params.require(:vacancy).permit(:title, :body)
  end
end
