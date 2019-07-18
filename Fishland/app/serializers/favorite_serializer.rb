class FavoriteSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :fish

  attributes :id, :user_id, :fish_id
end
