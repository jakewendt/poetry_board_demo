class MagnetsController < ApplicationController
	#	index, show, new, edit, create, update, destroy
	before_filter :login_required, :except => :update_position
	before_filter :get_board
	before_filter :check_board_owner, :except => [ :update_position ]

#	# GET /magnets
#	def index
#		@magnets = @board.magnets
#	end

#	# GET /magnets/:id
#	def show
#	end

#	# GET /magnets/new
#	def new
#		@magnet = Magnet.new
#	end

#	# GET /magnets/:id/edit
#	def edit
#	end

#	# POST /magnets
#	def create
#		@magnet = Magnet.new(params[:magnet])
#		@magnet.board = @board
#		if @magnet.save
#			flash[:notice] = 'Magnet was successfully created.'
#			redirect_to board_path(@board)
#		else
#			render :action => "new"
#		end
#	end

#	Possible security problem
#	If anyone can update a magnet
#	then anyone can change its word or owner
#	which is NOT what I'd like
#	Should probably create a routine 
#	like :update_position which is allowed by anyone
#	and then secure :update to just the owner
	# Called from the AJAX routine
	# PUT /magnets/:id/update_position
	def update_position
		@magnet = @board.magnets.find(params[:id])
		@magnet.top	= params[:magnet][:top]
		@magnet.left = params[:magnet][:left]
		unless @magnet.save
			flash[:error] = 'Magnet update FAILED!'
		end
#		render :nothing
	end

#	# PUT /magnets/:id
#	def update
#		if @magnet.update_attributes(params[:magnet])
#			flash[:notice] = 'Magnet was successfully updated.'
#		#	redirect_to board_path(@board)
#		else
#			flash[:error] = 'Magnet update FAILED!'
#		#	render :action => "edit"
#		end
#	end

	# DELETE /magnets/:id
	def destroy
		@magnet.destroy
	end

private

	def get_board
		@magnet = Magnet.find(params[:id])
		@board	= @magnet.board
	end

	def check_board_owner
		if current_user.id != @board.user_id 
			access_denied
		end
	end

end
