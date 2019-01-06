module ApplicationHelper

	def type_to_icon(cost)
		image_costs = ""
		types = cost.split
		types.each do |type|
			image_costs += image_tag(image_url("icons/#{type}.png"))
		end
		return image_costs
	end
end
