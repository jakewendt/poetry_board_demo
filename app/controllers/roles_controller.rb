class RolesController < ApplicationController
	layout 'application'
	before_filter :check_administrator_role

	def index
		@user = User.find(params[:user_id])
		@all_roles = Role.find(:all)
	end

	def update
		@user = User.find(params[:user_id])
		@role = Role.find(params[:id])
		unless @user.has_role?(@role.name)
			@user.roles << @role
		end
#		redirect_to user_roles_path(@user)
		redirect_to user_roles_url(@user)
	end

	def destroy
		@user = User.find(params[:user_id])
		@role = Role.find(params[:id])
		if @user.has_role?(@role.name)
			@user.roles.delete(@role)
		end
		if @user == current_user
#			redirect_to user_path(@user)
			redirect_to user_url(@user)
		else
#			redirect_to user_roles_path(@user)
			redirect_to user_roles_url(@user)
		end
	end

end