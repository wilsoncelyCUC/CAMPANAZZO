class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def index
    #Feature:  Button SELECTIONAR
    find_post
    @reservation = Reservation.new

    #Feature: filter bar =>
    #1) Filter out profiles by a job category wanted by the customer (stored in session[:profession_name])
    #a. find the profession_ID of the profession wanted by the user
    @profession = Profession.find_by(name: session[:profession_name])
    #b. Find profile having the profession_ID wanted
    profiles_for_session = Profile.joins(:my_professions).where(my_professions: {profession_id: @profession.id})
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
    @profiles = profiles_for_session.nil? ? [] : profiles_for_session
  end

  def show
    find_post
    @reservation = Reservation.new

    @profession = get_profession(session[:profession_name])
    @my_profession = (MyProfession.where(profile_id: @profile.id).where(profession_id: @profession.id)).first

    @skills = []

    @profile.professions.each do |profession|
      @skills << profession.name
    end


  end

  def filter
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:article).permit( :photo)
  end

  def find_post
    @post = Post.find(session[:post_id])
  end

end
