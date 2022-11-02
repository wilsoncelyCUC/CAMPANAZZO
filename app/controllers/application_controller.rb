class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def get_profession(element)
    #Temp Hard-code, if the profession isn't found then it returns cleaning.
    #correction will be provided an autocomplete list_of_profession in the homepage bar
    Profession.find_by(name: element) ? Profession.find_by(name: element) : Profession.find_by(name: 'Limpieza')
  end

  def get_profile
    @profile_connected = Profile.find_by(user_id: current_user.id)
  end

  def status_checker_past?(post)
    if !post.reservations.empty?
      resa = post.reservations
      if resa.first.end_date < Date.today
        true
      else
        false
      end
    else
      false
    end
  end


end
