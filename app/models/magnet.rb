class Magnet < ActiveRecord::Base
	belongs_to :board, :counter_cache => true

	validates_presence_of :board_id
	validates_numericality_of :top, :left, :greater_than_or_equal_to => 0

	def before_validation_on_create
		self.top = 0
		self.left = 0
	end
end
