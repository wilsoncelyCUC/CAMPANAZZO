class ProfessionsController < ApplicationController
before_action :find_profession, only: [:edit, :update, :destroy]

  def index
    @professions = Profession.all

    respond_to do |format|
      format.html
      format.json { render json: { professions: @professions } }
    end

  end

  def new
    @profession = Profession.new
    @professions = Profession.all

    respond_to do |format|
      format.html
      format.json {render json: professions = @professions}
    end

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

  def destroy
    @profession.posts.delete_all
    @profession.my_professions.delete_all
    @profession.delete
    redirect_to professions_path, status: :see_other
  end

  def autocomplete
    @professions = Profession.where("name LIKE ?","%#{params[:q]}%")
    render layout: false
  end

  private
  def profession_params
    params.require(:profession).permit(:name, :recommended_price, :currency, :unit, :photo , :url_photo)
  end

  def find_profession
    @profession = Profession.find(params[:id])
  end


end
