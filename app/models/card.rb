class Card < ActiveRecord::Base
	has_many :attacks
	has_one :ability
end