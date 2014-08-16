class Article < ActiveRecord::Base

	#dependent: destory will destory comment if releated article is deleted
	has_many :comments, dependent: :destroy

	# In articles_controller -> def create
	validates :title, presence: true, length: { minimum: 5 }
end
