class Bug < ApplicationRecord
	STAGES_LIST = ["To Do", "In Progress", "In Review", "Completed"]
	BUGS_TYPE = ["Bug", "Feature"]
	belongs_to  :project

	before_create :change_stage_of_project

	def change_stage_of_project
		self.project.update(stages: "To Do")
	end

	validates :title, presence:true, length: {maximum: 20, minimum:3}
	validates :stages,:bug_type, :project_id, presence: true
end
