class UserCardsController < ApplicationController

	def index

	end

	def show
	end

	def new
		@user_card = UserCard.new(user: current_user, card: card)
	end

	def create
		user_card = UserCard.create(user_card_params)
	end

	def update
		user_card = UserCard.find(params[:id])
		user_card.update_attributes(quantity: params[:user_card][:quantity])
	end

	private

	def user_card_params
		params.require(:user_card).permit(:card_id, :user_id, :quantity, :foil_quantity)
	end

end