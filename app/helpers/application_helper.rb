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
		if cost
			return image_tag(image_url("icons/#{cost}.png"))
		else
			return image_tag(image_url("icons/Pokeball.png"))
		end
	end

	def bad_string_to_regular(cost)
		if cost
			return cost
		else
			return "Pokeball"
		end
	end

	def convert_retreat_cost(cost, html_cost = "<p hidden>#{cost}</p>")
		unless (cost == 0 || cost == nil)
			cost.times{ html_cost = html_cost + image_tag(image_url("icons/Colorless.png"))}
		else
			
		end
		return html_cost.html_safe
	end

	def sub_icons_with_text(cost, icon = "", amount = "", text_with_icons = "")
		if cost.empty?
			text_with_icons = "<p hidden>A</p>"
		else
			types = cost.split
			types.each do |cost|
				if ENERGY_TYPES.include?(cost)
					icon = "<p hidden>#{cost}</p> " + image_tag(image_url("icons/#{cost}.png"))
				else
					amount = cost
				end
			end
			text_with_icons = "#{icon} #{amount}"
		end
		return text_with_icons.html_safe
	end
end
