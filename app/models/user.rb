class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :timeentries

  validates :id, uniqueness: true

  def total_hours( start_date, end_date, user_id )
		total = 0.0

		@timeentries = Timeentry.all.where(:time_in => start_date..end_date, :user_id => user_id).each do |t|
			if t.time_in.present? && t.time_out.present?
				total += t.elapsed_time(t.time_in, t.time_out)
			end
		end

		return total
	end
end
