class UserSerializer < ActiveModel::Serializer
  has_many :favorites
  has_many :fish, through: :favorites

  attributes :username, :password
end
