class Project < ApplicationRecord
	STAGES_LIST = ["To Do", "In Progress", "In Review", "Completed"]
	has_many :bugs, dependent: :destroy 
	has_many :user_projects
	has_many :users, through: :user_projects
	has_many :users
	accepts_nested_attributes_for :user_projects
end
