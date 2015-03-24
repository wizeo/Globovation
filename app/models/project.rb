class Project < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/main-image-default.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title, presence: {message: "can\'t be empty" }
	validates :blurb, presence: {message: "can\'t be empty" }
	validates :budget, numericality: { only_integer: true, message: "can only store numbers" }
	validates :location, presence: {message: "can\'t remain empty" }
end
