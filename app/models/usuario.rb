class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
        # :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: true, rut: true}


  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: true, rut: true}



  validates :rut, presence: true
 
end
