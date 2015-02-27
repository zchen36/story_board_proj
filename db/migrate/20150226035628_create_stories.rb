class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :point
      t.integer :stage
      t.references :projects, index: true

      t.timestamps null: false
    end
    add_foreign_key :stories, :projects
  end
end
