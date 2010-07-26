class CreateBoards < ActiveRecord::Migration
	def self.up
		create_table :boards do |t|
			t.string	:name,		:null => false
			t.integer :user_id, :null => false
			t.timestamps
		end
	end

	def self.down
		drop_table :boards
	end
end
