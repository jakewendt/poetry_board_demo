class BoardsController < ApplicationController
	#	index, show, new, edit, create, update, destroy
	before_filter :get_board, :except => [ :index, :new, :create ]
	before_filter :login_required, :except => [ :show ]
	before_filter :check_board_owner, :only => [ :edit, :update, :destroy ]

	layout 'application'

	# GET /boards
	def index
		@boards = Board.find_all_by_user_id(current_user)
	end

	# GET /boards/:id
	def show
		render :layout => "boards"
	end

	# GET /boards/new
	def new
		@board = Board.new
	end

	# GET /boards/:id/edit
	def edit
	end

	# POST /boards
	def create
		@board = Board.new(params[:board])
		@board.user_id = current_user.id
		if @board.save
			flash[:notice] = 'Board was successfully created.'
#			redirect_to(edit_board_path(@board))
			redirect_to(edit_board_url(@board))
		else
			render :action => "new"
		end
	end

	# PUT /boards/:id/add_magnet
	def add_magnet
		@magnet = Magnet.create({
#			:user_id => current_user.id,
			:board_id => @board.id,
			:word => "" });
	end

	def update
		# Found this method online at ...
		# http://wiki.rubyonrails.org/rails/pages/HowToUpdateModelsWithHasManyRelationships
		# What's the practical difference here between .collect or .each
		update_result = @board.update_attributes(params[:board])
		@board.magnets.collect do |magnet|
			# I don't understand why I need this "if"
			# If there aren't any magnets, it shouldn't be here?
			if params[:magnet]
				update_result &&= magnet.update_attributes(params[:magnet][magnet.id.to_s])
			end
		end
		unless update_result
			render :action => 'edit'
		end
	end

	# PUT /boards/:id
	def update_ORIG
		if @board.update_attributes(params[:board])
#	I don't know if this is the "right"
#	way to handle this, but it works.
			if params[:magnet]
				params[:magnet].each do |m|
					#	m[0] = id
					#	m[1] = { word => "the value" }
					magnet = @board.magnets.find_by_id(m[0])
					if ( magnet.user_id == current_user.id )
						magnet.word = m[1][:word]
						magnet.save
					end
				end
			end
		else
			render :action => "edit"
		end
	end

	# DELETE /boards/:id
	def destroy
		@board.destroy
		redirect_to(boards_url)
	end

protected

	def get_board
		@board = Board.find(params[:id], :include => :magnets)
	end

	def check_board_owner
		if current_user.id != @board.user_id
			access_denied
		end
	end

end
