class AddProjectIdToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :project_id, :integer
    add_index :solutions, :project_id
  end
end
