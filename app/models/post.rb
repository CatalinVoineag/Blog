class Post < ActiveRecord::Base

	belongs_to :user

	validates :title, presence: true, length: {in: 2..50}
	validates :content, presence: true, length: {in: 2..9999999999999}

end
