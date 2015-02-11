class Timeentry < ActiveRecord::Base
	belongs_to :user

	def elapsed_time(a, b)
		((b - a) / 3600).round 2
	end
end