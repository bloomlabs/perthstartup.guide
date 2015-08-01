namespace :search_suggestions do
	desc "Generate search suggestions from companies"
	task :index => :environment do 
		SearchSuggestion.index_companies
	end	
end