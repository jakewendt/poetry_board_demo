class AddMagnetsCount < ActiveRecord::Migration
	def self.up
		add_column :boards, :magnets_count, :integer, :null => false, :default => 0
	end

	def self.down
		remove_column :boards, :magnets_count
	end
end
