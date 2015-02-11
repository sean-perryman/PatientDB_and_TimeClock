class Timeentry < ActiveRecord::Base
	belongs_to :user
	belongs_to :payperiod

	def elapsed_time(a, b)
		((b - a) / 3600).round 2
	end

end