class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :budget, :integer
    add_column :projects, :blurb, :string
    add_column :projects, :location, :string
    add_column :projects, :published_at, :boolean
  end
end
