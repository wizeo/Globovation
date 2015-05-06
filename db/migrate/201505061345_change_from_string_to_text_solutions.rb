class ChangeFromStringToTextSolutions< ActiveRecord::Migration
	def up
	  change_column :solutions, :description, :text, :limit => nil
	end
	def down
	  change_column :solutions, :description, :string
	end
end