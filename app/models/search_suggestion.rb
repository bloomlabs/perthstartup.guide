class SearchSuggestion < ActiveRecord::Base

	def self.terms_for(prefix)
		# Rails.cache.fetch(["search-terms", prefix]) do
			# suggestions = where("term like ?" "#{prefix}_%")
			# suggestions.order("popularity desc").limit(10).pluck(:term)
		# end

		suggestions = where("term like ?", "#{prefix}_%")
		suggestions.order("popularity desc").limit(10).pluck(:term)
	end

	def self.index_companies
		Company.find_each do |company|
			index_term(company.name)
			# company.name.split.each { |t| index_term(t) }
		end
	end

	def self.index_term(term)
		where(term: term.downcase).first_or_initialize.tap do |suggestion|
		# where(term).first_or_initialize.tap do |suggestion|
			suggestion.increment! :popularity
		end
	end
end
