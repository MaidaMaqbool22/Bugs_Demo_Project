class Bug < ApplicationRecord
	STAGES_LIST = ["To Do", "In Progress", "In Review", "Completed"]
	BUGS_TYPE = ["Bug", "Feature"]
	belongs_to  :project
end
