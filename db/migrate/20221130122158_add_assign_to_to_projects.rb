class AddAssignToToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :assign_to, :string
    add_index :projects, :assign_to
  end
end
