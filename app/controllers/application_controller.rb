class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_types_profiles

  # To enable sign in to function correctly.
  skip_before_action :verify_authenticity_token, :only => :create

  # def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:whatsapp, :type_profile])

  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:whatsapp, :type_profile])
  # end

  def configure_permitted_parameters
    added_attrs = [:whatsapp, :login, :email, :encrypted_password, :encrypted_password_confirmation, :remember_me, :type_profile]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    if Profile.find_by(user_id: current_user.id).nil?
      new_profile_path
    else
      if (Profile.find_by(user_id: current_user.id)).type_profile == 'Professional'
        pages_home_worker_path
      else
        root_path
      end
    end
  end


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

  def get_types_profiles
    @type_customer = 'Busco CONTRATAR Trabajadores'
    @type_worker = 'Quiero TRABAJAR'
  end


end
