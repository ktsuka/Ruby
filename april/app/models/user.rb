class User < ActiveRecord::Base
  validates :password, presence: { on: :create },
	    confirmation: { allow_blank: true }
  attr_accessor :password, :password_confirmation

  def password=(entered_password)
	if entered_password.present?
      self.hashed_password = BCrypt::Password.create(entered_password)
    end
    @password = entered_password
  end

  class << self
    def authenticate(name, password)
      user = find_by(name: name)
      if user && user.hashed_password.present? &&
        BCrypt::Password.new(user.hashed_password) == password
        user
      else
        nil
      end
    end
  end
end