class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:Developer, :QA, :admin], multiple: false)                                      ##
  ############################################################################################ 
 

  has_many :user_projects
  has_many :projects, through: :user_projects
  # has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  USER_TYPE = ["Developer", "QA","admin"]

  validates :email , :first_name, :last_name, presence: true

#   PASSWORD_FORMAT = /\A 
#   (?=.[A-Z])        # Must contain an upper case character
# /x
#   validates :password,
#   presence: true, 
#   format: { with: PASSWORD_FORMAT}, 
#   on: :create 
validate :password_requirements_are_met
def password_requirements_are_met
  rules = {
    " contain uppercase letters only"  => /[a-z]+/,
  }

  rules.each do |message, regex|
    return errors.add( :password, message ) unless password.match( regex )
  end
end

def full_name
  return self.first_name + ' ' + self.last_name
end
end
