class CardSetsController < ApplicationController

	def index
		@series = Series.all
	end
end