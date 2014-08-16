class Article < ActiveRecord::Base
	has_many :comments

	# In articles_controller -> def create
	validates :title, presence: true, length: { minimum: 5 }
end
