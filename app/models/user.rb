class User < ApplicationRecord
  has_many :profiles, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Variables for the sign-in flow

  @type_customer = 'Busco CONTRATAR Trabajadores'
  @type_worker = 'Quiero TRABAJAR'

  TYPE_PROFILE = [ "#{@type_customer}" , "#{@type_worker}"  ]
  # the variables : @type_customer and @type_worker were declared on the application controller

  attr_accessor :login

  def login
    @login || self.whatsapp || self.email
  end

  def email_required?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:whatsapp)
      where(conditions.to_h).where(["lower(whatsapp) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:whatsapp) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
