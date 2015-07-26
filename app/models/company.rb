class Company < ActiveRecord::Base

	TYPES = ['Startup', 'Accelerator', 'Incubator', 'Investor', 'Coworking', 'Consulting', 'Event', 'Hackspace']
	geocoded_by :address
	after_validation :geocode
end
