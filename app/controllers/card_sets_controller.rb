class CardSetsController < ApplicationController

	def index
		@series = Series.all
	end

	def show
		@set = CardSet.find(params[:id])
		@cards = @set.cards
	end
end