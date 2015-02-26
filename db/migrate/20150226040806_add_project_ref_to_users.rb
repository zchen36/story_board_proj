class AddProjectRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :project, index: true
    add_foreign_key :users, :projects
  end
end
