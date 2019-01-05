class CardsController < ApplicationController

	def index
		@cards = Card.all
	end

	def new

	end

	def create

	end
end