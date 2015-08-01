class SearchSuggestionsController < ApplicationController
	def index
		# render json: %w[foo bar]
		render json: SearchSuggestion.terms_for(params[:term])

	end
end
