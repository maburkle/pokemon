class CardSetsController < ApplicationController

	def index
		@sets = CardSet.all
	end
end