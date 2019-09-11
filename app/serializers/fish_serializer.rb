class FishSerializer < ActiveModel::Serializer
  has_many :favorites
  has_many :users, through: :favorites

  attributes :id, :name, :information, :facts, :habitat, :diet, :tips
end
