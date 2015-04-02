class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :title
      t.string :description
      t.integer :votes
      t.boolean :admin_approval

      t.timestamps
    end
  end
end
