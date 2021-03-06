class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :preview_image
      t.integer :author_id
      t.string :file
      t.string :link

      t.timestamps null: false
    end
  end
end
