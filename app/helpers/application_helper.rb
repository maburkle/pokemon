module ApplicationHelper
	ENERGY_TYPES = ["Colorless", "Darkness", "Fariy", "Fighting", "Fire", "Grass", "Lightning", "Metal", "Psychic", "Water"]

	def type_to_icon(cost, image_costs = "")
		types = cost.split
		types.each do |type|
			image_costs += image_tag(image_url("icons/#{type}.png"))
		end
		return image_costs
	end

	def to_icon(cost)
		types = cost.gsub("[\"", "").gsub("\"]","")
		return image_tag(image_url("icons/#{types}.png"))
	end

	def convert_retreat_cost(cost)
		html_cost = "<p class='hidden'>#{cost}</p>"
		cost.times{ html_cost = html_cost + image_tag(image_url("icons/Colorless.png"))} unless (cost == 0 || cost == nil)
		return html_cost.html_safe
	end

	def sub_icons_with_text(cost, icon = "", amount = "", text_with_icons = "<p class='hidden'>A</p>")
		if cost
			types = cost.split
			types.each do |cost|
				if ENERGY_TYPES.include?(cost)
					icon = "<p class='hidden'>#{cost}</p> " + image_tag(image_url("icons/#{cost}.png"))
				else
					amount = cost
				end
			end
			text_with_icons = "#{icon} #{amount}".html_safe
		end
		return text_with_icons
	end

	def weigh_rarity(rarity)
		case rarity
		when "Promo"
			"<p class='hidden'>0<p> #{rarity}"
		when "Common"
  		"<p class='hidden'>1<p> #{rarity}"
		when "Uncommon"
  		"<p class='hidden'>2<p> #{rarity}"
  	when "Rare"
  		"<p class='hidden'>3<p> #{rarity}"
  	when "Rare Holo"
  		"<p class='hidden'>4<p> #{rarity}"
  	when "Rare Holo GX"
  		"<p class='hidden'>5<p> #{rarity}"
  	when "Rare Ultra"
  		"<p class='hidden'>6<p> #{rarity}"
  	when "Rare Secret"
  		"<p class='hidden'>7<p> #{rarity}"
		else
  		"<p class='hidden'>8<p> #{rarity}"
		end
	end
end
