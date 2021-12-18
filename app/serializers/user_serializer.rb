class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :firstname, :lastname, :username, :password_digest
  has_many :blogs
end
