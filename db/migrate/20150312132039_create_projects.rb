class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :main_img_url

      t.timestamps
    end
  end
end
