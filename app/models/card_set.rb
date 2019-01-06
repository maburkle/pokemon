class CardSet < ActiveRecord::Base
	has_many :cards, :foreign_key => "set_id", :class_name => "Card"
	belongs_to :series
end