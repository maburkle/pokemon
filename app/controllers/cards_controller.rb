class CardsController < ApplicationController

	def index
		@cards = Card.all
	end

	def show
		@card = Card.find(params[:id])
		@user_card = UserCard.find_by(user: current_user, card: @card) || UserCard.new(user: current_user, card: @card) if current_user.present?
	end

	def create
	end

	def update

	end
end