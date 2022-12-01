class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projectsex
  has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  USER_TYPE = ["Developer", "QA"]
end
