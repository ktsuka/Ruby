class User < ActiveRecord::Base
	validates :password, presence: true,
	    confirmation: { allow_blank: true }
	attr_accessor :password, :password_confirmation

	def password=(val)
	  if val.present?
        self.hashed_password = BCrypt::Password.create(val)
      end
      @password = val
    end

end