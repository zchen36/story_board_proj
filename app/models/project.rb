class Project < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :users
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
end
