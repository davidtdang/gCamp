class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  has_secure_password

end

# class User < ActiveRecord::Base
#   validates :first_name, presence: true
#   validates :last_name, presence: true
#   validates :email, presence: true
#   validates :email, uniqueness: true
#   has_secure_password
#
# end
