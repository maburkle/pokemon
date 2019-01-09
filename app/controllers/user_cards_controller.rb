class UserCardsController < ApplicationController

	def index
		
	end

	def show
		
	end

	def create
		@user_card = UserCard.create(user_card_params)
		binding.pry
	end

	def update

	end

	private

	def user_card_params
		params.require(:user_card).permit(:quantity, :foil_quantity)
	end

end