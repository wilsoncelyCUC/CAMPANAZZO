class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save!
      set_type_profile(@profile , current_user)
      if @profile.type_profile == 'Customer'
        redirect_to root_path
      else
        redirect_to my_profile_path
      end
    else
      render :new
    end
  end

  def edit
    @profile = @profile_worker
  end

  def my_profile
    @profile = Profile.find_by(user_id: current_user.id)
    @user_profile = User.find(@profile.user_id)

    if @profile.type_profile == 'Professional'
      @skills = []
      @profile.my_professions.each do |my_profession|
        @skills << MyProfession.find(my_profession.id)
      end
    end
  end

  def update
    @profile = @profile_worker
    if @profile.update(profile_params)
      if @profile == Profile.find_by(user_id: current_user.id)
        redirect_to my_profile_path
      else
        redirect_to profile_path(@profile)
      end
    else
      render :new
    end
  end

  def index

    if session[:profession_name]
      #Feature:  Button SELECTIONAR
      find_post
      @reservation = Reservation.new
      #Feature: filter bar =>
      #1) Filter out profiles by a job category wanted by the customer (stored in session[:profession_name])
      #a. find the profession_ID of the profession wanted by the user
      @profession = session[:profession_name].nil? ? '' : Profession.find_by(name: session[:profession_name])
      #b. Find profile having the profession_ID wanted
      profiles_for_session = @profession.nil? ? Profile.all :  Profile.joins(:my_professions).where(my_professions: {profession_id: @profession.id})
    else
      redirect_to root_path
    end
    @profiles = profiles_for_session.nil? ? Profile.all : profiles_for_session

    #2) Enable filter bar. element: Type, Date, Hour, Price
    if params[:filter].present?
      # type, (string)-> Search with scope
      if params[:filter][:type_super].present?
        profiles_for_session =  profiles_for_session.pgsearch_super(params[:filter][:type_super])
      end
      # date, (date) -> Search with association (Reservation)
        # -> TBD : current version lacks of booking based on avaialability Day/hour
      if params[:filter][:date].present?
        case params[:filter][:date]
        when 'Hoy'
          profiles_for_session =  Profile.joins(:reservations).where.not(reservations: {start_date: Date.today}).distinct
        when 'Max en 3 Días'
          profiles_for_session =  Profile.joins(:reservations).where.not(reservations: {start_date: Date.today + 3.day}).distinct
        when 'Max en 7 Días'
          profiles_for_session =  Profile.joins(:reservations).where.not(reservations: {start_date: Date.today + 7.day}).distinct
        else
          @profiles =  profiles_for_session
        end
      end
      # hour, (a range of integer)
        #-> TBD
      # price, a integer -> Search with association (my_professions)
      if params[:filter][:price].present?
        case params[:filter][:price]
        when '20 y 50 kCOP'
          profiles_for_session = Profile.joins(:my_professions).where(my_professions: {price_hour: 20000..50000, profession_id:@profession.id })
        when '51 y 70 kCOP'
          profiles_for_session = Profile.joins(:my_professions).where(my_professions: {price_hour: 51000..70000, profession_id:@profession.id})
        when '+ de 70 kCOP'
          profiles_for_session = Profile.joins(:my_professions).where(my_professions: {price_hour: 70000..150000, profession_id:@profession.id })
        else
          @profiles =  profiles_for_session
        end
      end
     @profiles =  profiles_for_session
    end
  end

  def all
    @profiles = Profile.all
  end

  def show
    get_profile
    # if session_profile_not_empty?
    #   find_profile
    #   @profession = get_profession(session[:profession_name])
    #   @my_profession = (MyProfession.where(profile_id: @profile_worker.id).where(profession_id: @profession.id)).first
    # else
    #   @profile = profile.new
    # end

    @reservation = Reservation.new

    @skills = []
    @profile_worker.professions.each do |profession|
      @skills << profession.name
    end
    @reviews = Review.where(profile_id: @profile_worker.id)
  end

  def destroy
    find_profile
    find_review(@profile_worker, @profile )
  end

  def filter
  end

  private

  def find_profile
    @profile_worker = Profile.find(params[:id])
  end

  def find_post
    @post = Post.find(session[:post_id])
  end

  def find_review(profile_worker, profile )
    @review = profile_worker.reviews.where(profile_id: profile)
  end


  def session_profile_not_empty?
    !session[:profile_id].nil?
  end

  def profile_params
    params.require(:profile).permit(:name, :last_name, :birthday, :type_profile, :country, :address, :personal_number, :vehicle , :photo, :phone, :email)
  end

  def set_type_profile(profile , user)

    if user.type_profile == @type_customer
      profile.type_profile = 'Customer'
    else
      profile.type_profile = 'Professional'
    end
    profile.save!
  end

end
