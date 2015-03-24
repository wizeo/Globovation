class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :projects, :published_at, :is_published
  end
end
