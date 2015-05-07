class Project < ActiveRecord::Base
	belongs_to :user

	has_many :solution
	accepts_nested_attributes_for :solution

	has_attached_file :image, :styles => {:large => "800x800>", :medium => "400x400>", :thumb => "100x100>" }, :default_url => "http://globovation.s3.amazonaws.com/img/main-image-default.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title, presence: {message: "can\'t be empty" }
	validates :blurb, presence: {message: "can\'t be empty" }
	validates :description, presence: {message: "can\'t be empty" }
	validates :budget, numericality: { only_integer: true, allow_nil: true, message: "can only store numbers" }
	validates :location, presence: {message: "can\'t be empty" }

	def to_param
		"#{id} #{title}".parameterize
	end
	
end
