class SearchSuggestionsController < ApplicationController
	def index
		render json: SearcchSuggestion.terms_for(params[:term])
	end
end
