class Bug < ApplicationRecord
	STAGES_LIST = ["To Do", "In Progress", "In Review", "Completed"]
	BUGS_TYPE = ["Bug", "Feature"]
	belongs_to  :project

  # polymorphic association for discription
  has_many :discriptions, as: :discriptionable
  accepts_nested_attributes_for :discriptions, 
	                              reject_if: lambda {|attrs| attrs['detail'].blank?}

	before_create :change_stage_of_project

	def change_stage_of_project
		if self.project.stages == "Completed"
			self.project.update(stages: "To Do")
		end
	end

	validates :title, presence:true, length: {maximum: 20, minimum:3}
	validates :stages,:bug_type, :project_id, presence: true
end
