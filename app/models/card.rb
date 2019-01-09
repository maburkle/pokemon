class Card < ActiveRecord::Base
	has_many :attacks
	has_one :ability
	has_many :user_cards
	has_many :users, through: :user_cards
	belongs_to :card_set, foreign_key: "set_id"

	def rarity_weight
		case self.rarity
		when "Promo"
			value = 0
		when "Common"
  		value = 1
		when "Uncommon"
  		value = 2
  	when "Rare"
  		value = 3
  	when "Rare Holo"
  		value = 4
  	when "Rare Holo GX"
  		value = 5
  	when "Rare Ultra"
  		value = 6
  	when "Rare Secret"
  		value = 7
		else
  		value = 8
		end
		return "<p class='hidden'>#{value}</p> #{self.rarity}"
	end
end