class ProfessionsController < ApplicationController
before_action :find_profession, only: [:edit, :update, :destroy]

  def index
    @professions = Profession.all
  end

  def new
    @profession = Profession.new
  end

  def create
    @profession = Profession.new(profession_params)
    if @profession.save
      redirect_to  professions_path
    else
      render 'professions/new'
    end
  end

  def edit
  end

  def update
    if @profession.update(profession_params)
      redirect_to professions_path
    else
      render :new
    end
  end


  private
  def profession_params
    params.require(:profession).permit(:name, :recommended_price, :currency, :unit, :url_photo)
  end

  def find_profession
    @profession = Profession.find(params[:id])
  end


end
