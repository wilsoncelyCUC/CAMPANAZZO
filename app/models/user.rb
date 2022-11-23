class User < ApplicationRecord
  has_many :profiles, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => {email: true, login: false}
  # Variables for the sign-in flow

  @type_customer = 'Busco CONTRATAR Trabajadores'
  @type_worker = 'Quiero TRABAJAR'

  TYPE_PROFILE = [ "#{@type_customer}" , "#{@type_worker}"  ]
  # the variables : @type_customer and @type_worker were declared on the application controller

  validates :whatsapp, uniqueness: true

  def email_required?
   false
  end

  def email_changed?
   false
  end


  attr_writer :login

  def login
    @login || self.whatsapp || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(["lower(whatsapp) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:whatsapp].nil?
        where(conditions).first
      else
        where(whatsapp: conditions[:whatsapp]).first
      end
    end
  end

end
