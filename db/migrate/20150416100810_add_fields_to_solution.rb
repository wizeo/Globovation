class AddFieldsToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :is_published, :boolean
    add_column :solutions, :blurb, :string
  end
end
