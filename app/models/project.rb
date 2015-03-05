class Project < ActiveRecord::Base

	has_many :tasks 
	validates :title, 
	presence: {message: "Please enter project title."},
	length: {minimum: 3, message: "短すぎィ！"}

end
