class User < ActiveRecord::Base
	attr_accessor :password
	
	#relationships
	has_many :timeentries

	#validations
	validates :name, presence: true, if: :name
	validates :employee_id, numericality: true, 
													:on => :update,
													uniqueness: true,
													:allow_nil => true
	validates :email, presence: true,
										uniqueness: true,
										if: :email

	validates_presence_of :password, if: :password, :on => :create
	validates_confirmation_of :password

	#before actions
	before_save :encrypt_password, :unless => Proc.new { |u| u.password.blank? }
	before_save { self.email = email.downcase }

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

  def self.authenticate(email, password)
	  user = User.where(:email => email).first
	  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	  	user
	  else
	  	nil
	  end
  end

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