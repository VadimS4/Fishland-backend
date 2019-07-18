class Favorite < ApplicationRecord 
    belongs_to :user
    has_many :fish
    
    #Before favorite is created, make sure that it has a user_id and a fish_id
    validates :user_id, presence: true
    validates :fish_id, presence: true
end
