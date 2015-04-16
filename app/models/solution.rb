class Solution < ActiveRecord::Base
	belongs_to :user
	
	belongs_to :project

	validates :title, presence: {message: "can\'t be empty" }
	validates :blurb, presence: {message: "can\'t be empty" }
	validates :description, presence: {message: "can\'t be empty" }
end
