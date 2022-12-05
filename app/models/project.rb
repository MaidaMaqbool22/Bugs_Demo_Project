class Project < ApplicationRecord
	STAGES_LIST = ["To Do", "In Progress", "In Review", "Completed"]
	has_many :bugs, dependent: :destroy 
	has_many :user_projects
	has_many :users, through: :user_projects
	has_many :users
	accepts_nested_attributes_for :user_projects
	validates :title, presence: true, length: {maximum: 10, minimum:3}
	validates :stages, presence: true
	# after_commit :abc


	# def abc
	# 	debugger
	# end

	validate :check_existence_of_bugs

	def check_existence_of_bugs
		if self.stages == "Completed"
			if self.bugs.where.not(stages: "Completed").present?
				self.errors.add(:base, "still #{self.bugs.count} Bugs!! that's why project cannot be in complete stage")
				return false
			else
				return true
			end
		end
	end

	before_update :project_limit_set

	def project_limit_set
		debugger
	end
end
