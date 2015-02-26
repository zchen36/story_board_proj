class AddStoryRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :story, index: true
    add_foreign_key :users, :stories
  end
end
