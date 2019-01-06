class CardSetsController < ApplicationController

	def index
		@series = Series.all
	end

	def show
		@set = CardSet.find(params[:id])
		@cards = @set.cards.sort_by { |c| c.card_number.scan(/\d+/).first.to_i }
	end
end