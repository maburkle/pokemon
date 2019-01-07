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
		html_cost = "<p hidden>#{cost}</p>"
		cost.times{ html_cost = html_cost + image_tag(image_url("icons/Colorless.png"))} unless (cost == 0 || cost == nil)
		return html_cost.html_safe
	end

	def sub_icons_with_text(cost, icon = "", amount = "", text_with_icons = "<phidden>A</p>")
		if cost
			types = cost.split
			types.each do |cost|
				if ENERGY_TYPES.include?(cost)
					icon = "<p hidden>#{cost}</p> " + image_tag(image_url("icons/#{cost}.png"))
				else
					amount = cost
				end
			end
			text_with_icons = "#{icon} #{amount}".html_safe
		end
		return text_with_icons
	end
end
