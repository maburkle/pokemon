class Card < ActiveRecord::Base
	has_many :attacks
	has_one :ability
	belongs_to :card_set, foreign_key: "set_id"
end