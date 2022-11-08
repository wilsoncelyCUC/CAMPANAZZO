class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Variables for the sign-in flow

  @type_customer = 'Busco CONTRATAR Trabajadores'
  @type_worker = 'Quiero TRABAJAR'

  TYPE_PROFILE = [ "#{@type_customer}" , "#{@type_worker}"  ]
  # the variables : @type_customer and @type_worker were declared on the application controller


end
