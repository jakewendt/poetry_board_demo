class Board < ActiveRecord::Base
	has_many :magnets, :dependent => :destroy
	belongs_to :user, :counter_cache => true

	validates_presence_of :name
	validates_length_of	 :name, :within => 3..40
end
