class AddProjectReferenceToBugs < ActiveRecord::Migration[7.0]
  def change
    add_reference :bugs, :project, foreign_key: true
  end
end
