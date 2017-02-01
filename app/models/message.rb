class Message < ActiveRecord::Base

	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { in: 1..50 }
	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates :message, presence: true


end
