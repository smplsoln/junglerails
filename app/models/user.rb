class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 3 }

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)

    # strip whitespace from email
    email = email.strip unless email.nil?

    # case insensitive search
    user = User.where('lower(email) = ?', email.downcase).first

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      user
    else
      nil
    end

  end

end
