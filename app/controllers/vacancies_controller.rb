class VacanciesController < ApplicationController
  before_action :authenticate_user!, only: %i[my_vacancies]

  def index
    @vacancies = Vacancy.all
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    default_values = { title: current_user.name }

    @vacancy = Vacancy.new(default_values)
  end

  def edit
    @vacancy = Vacancy.find(params[:id])
    authorize!(@vacancy)
  end

  def create
    @vacancy = current_user.vacancies.build(vacancy_params)

    if @vacancy.save
      redirect_to vacancy_path(@vacancy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    authorize!(@vacancy)

    if @vacancy.update(vacancy_params)
      redirect_to vacancy_path(@vacancy)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vacancy = Vacancy.find(params[:id])
    authorize!(@vacancy)

    @vacancy.destroy
    redirect_to vacancies_path
  end

  def my_vacancies
    @my_vacancies = current_user.vacancies
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :body)
  end
end
