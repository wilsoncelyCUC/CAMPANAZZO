class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def get_profession(element)
    #Temp Hard-code, if the profession isn't found then it returns cleaning.
    #correction will be provided an autocomplete list_of_profession in the homepage bar
    Profession.find_by(name: element) ? Profession.find_by(name: element) : Profession.find_by(name: 'Limpieza')
  end

end
