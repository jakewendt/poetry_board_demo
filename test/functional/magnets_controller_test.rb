require File.dirname(__FILE__) + '/../test_helper'

class MagnetsControllerTest < ActionController::TestCase

	def setup
		@board			= boards(:myboard)
		login_as 'quentin'
	end

#	def test_should_get_index
#		get :index, :board_id => @board
#		assert_response :success
#		assert_not_nil assigns(:magnets)
#	end

#	def test_should_get_new
#		get :new, :board_id => @board
#		assert_response :success
#	end

#	def test_should_create_magnet
#		assert_difference('Magnet.count', 1) do
#			post :create, :magnet => { }, :board_id => @board
#		end
#		assert_redirected_to board_path(@board)
#	end

#	def test_should_show_magnet
#		get :show, :id => magnets(:one).id, :board_id => @board
#		assert_response :success
#	end

#	def test_should_get_edit
#		get :edit, :id => magnets(:one).id, :board_id => @board
#		assert_response :success
#	end

#	def test_should_update_magnet
#		put :update, :id => magnets(:one).id, :magnet => { :word => "New word" }, :board_id => @board
#		assert_response :success
#	end

	def test_should_destroy_magnet
		assert_difference('Magnet.count', -1) do
			delete :destroy, :id => magnets(:one).id, :board_id => @board
		end
		assert_response :success
	end
end
