class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def cards
		@user = User.find(params[:user_id])
		@collection = UserCard.where(user_id: @user.id)
	end

end