class CreateMagnets < ActiveRecord::Migration
	def self.up
		create_table :magnets do |t|
			t.string	:word, :null => false
			t.integer :top,	:null => false, :default => 0
			t.integer :left, :null => false, :default => 0
			t.integer :board_id, :null => false
			t.timestamps
		end
	end

	def self.down
		drop_table :magnets
	end
end
