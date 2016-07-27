class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	def check(date1,date2)
		return true if date2 < self.start_date || date1 > self.end_date
		return false
	end
end
