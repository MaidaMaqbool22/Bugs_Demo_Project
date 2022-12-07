class Project < ApplicationRecord
	STAGES_LIST = ["To Do", "In Progress", "In Review", "Completed"]

	# one_to_many between project and bugs
	has_many :bugs, dependent: :destroy 

	# many_to_many using through between users and projects
	has_many :user_projects, dependent: :destroy 
	has_many :users, through: :user_projects

	# polymorphic association for discription
	has_many :discriptions, as: :discriptionable
	accepts_nested_attributes_for :discriptions, 
	                              reject_if: lambda {|attrs| attrs['detail'].blank?}

	accepts_nested_attributes_for :user_projects
	validates :title, presence: true, length: {maximum: 10, minimum:3}
	validates :stages, presence: true
	


	validate :check_existence_of_bugs

	def check_existence_of_bugs
		if self.stages == "Completed"
			if self.bugs.where.not(stages: "Completed").present?
				self.errors.add(:base, "still #{self.bugs.count} Bugs!! that's why project cannot be in complete stage")
				return false
			else
				debugger
				self.user_projects.destroy_all
				return true
			end
		end
	end

	validate :project_limit_set

	def project_limit_set
		if self.user_id
			if User.find(self.user_id).projects.count >= 3
				self.errors.add(:base, "can't assign more than three projects")
				return false		
		    end
		else
			return true
	    end
	end


end
