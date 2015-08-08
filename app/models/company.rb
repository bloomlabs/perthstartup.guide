class Company < ActiveRecord::Base

	TYPES = ['Startup', 'Accelerator', 'Incubator', 'Investor', 'Coworking', 'Consulting', 'Event', 'Hackspace']
	geocoded_by :address
	after_validation :geocode

	# def self.search(search)
 # 		where("type_of like ?", "%#{search}%")
	# end

	# ?utf8=✓&search=#index
end
