class MyProfessionsController < ApplicationController
  before_action :find_my_profession, only: [:show, :edit, :update, :destroy]


  def new
    @my_profession = MyProfession.new
  end

  def create
    find_profile_worker
    @my_profession = MyProfession.new(my_profession_params)
    @my_profession.profile = @profile_worker
    if @my_profession.save
      redirect_to my_profile_path
    else
      flash[:alert] = 'Algo salió mal :S '
      render :new
    end
  end

  def edit
  end

  def update
    if  @my_profession.update(my_profession_params)
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def destroy
    @my_profession.delete
    redirect_to my_profile_path, status: :see_other

  end


  private
  def my_profession_params
    params.require(:my_profession).permit(:profession_id, :year, :price_hour, :price_day, :bio)
  end

  def find_my_profession
    @my_profession = MyProfession.find(params[:id])
  end

  def find_profile_worker
    @profile_worker = Profile.find_by(user_id: current_user.id)
  end

end
