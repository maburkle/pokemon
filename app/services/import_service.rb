class ImportService
	require 'pokemon_tcg_sdk'

	#Pass a Pokemon's National Pokedex number to import all cards, attacks, and abilities, associated with that Pokemon

	def self.import_card(card_number, card_resistance="", card_weakness="", retreat_cost=0)
		cards = Pokemon::Card.where(nationalPokedexNumber: card_number)
		cards.each do |card|
			unless Card.find_by(api_id: card.id)
				if card.weaknesses
					card.weaknesses.each do |weakness|
						card_weakness += (" " + weakness.type + " " + weakness.value)
					end
				end
				if card.resistances
					card.resistances.each do |resistance|
						card_resistance += (" " + resistance.type + " " + resistance.value)
					end
				end
				retreat_cost = card.retreat_cost.count if card.retreat_cost
				@card = Card.create(
					name: 				card.name,
      		image_url: 		card.image_url,
      		hd_image_url: card.image_url_hi_res,
      		hp: 					card.hp,
      		energy_types: card.types,
      		card_number: 	card.number,
      		sub_type: 		card.subtype,
      		super_type: 	card.supertype,
    			flavor_text:  card.text,
    			retreat_cost: retreat_cost,
    			artist:       card.artist,
    			set_id:       CardSet.find_by(name: card.set).id,
    			rarity:       card.rarity,
    			weakness:     card_weakness,
    	  	resistance:   card_resistance,
    			api_id:       card.id
				)

				self.import_attacks(card) if card.attacks
				self.import_ability(card) if card.ability

			end
		end
	end

	#Imports all Sets and Series from the api

	def self.import_set
		sets = Pokemon::Set.all
		sets = sets.sort_by { |obj| Date.strptime(obj.release_date, "%m/%d/%Y") }
		sets.each do |set|
			if set.code == ("smp" || "bwp" || "xyp")
				series = ::Series.create(name: set.name, logo_image_url: set.logo_url)
			elsif set.name == set.series
				series = ::Series.create(name: set.name, logo_image_url: set.logo_url)
			else
				series = ::Series.where(name: set.series).last
				unless series
					series = ::Series.create(name: set.series, logo_image_url: set.logo_url)
				end
			end
			@set = ::CardSet.create(
				name: 		  	 		set.name,
    		series_id: 		 		series.id,
    		release_date:  		set.release_date,
    		symbol_image_url: set.symbol_url,
    		logo_image_url:   set.logo_url,
    		total_cards:      set.total_cards,
    		set_api_name:     set.ptcgo_code
			)
		end
	end

	def self.import_card_by_set(set_name, card_resistance="", card_weakness="", retreat_cost=0)
		cards = Pokemon::Card.where(set: set_name.downcase)
		cards.each do |card|
			unless Card.find_by(api_id: card.id)
				if card.weaknesses
					card.weaknesses.each do |weakness|
						card_weakness += (" " + weakness.type + " " + weakness.value)
					end
				end
				if card.resistances
					card.resistances.each do |resistance|
						card_resistance += (" " + resistance.type + " " + resistance.value)
					end
				end
				retreat_cost = card.retreat_cost.count if card.retreat_cost
				@card = Card.create(
					name: 				card.name,
      		image_url: 		card.image_url,
      		hd_image_url: card.image_url_hi_res,
      		hp: 					card.hp,
      		energy_types: card.types,
      		card_number: 	card.number,
      		sub_type: 		card.subtype,
      		super_type: 	card.supertype,
    			flavor_text:  card.text,
    			retreat_cost: retreat_cost,
    			artist:       card.artist,
    			set_id:       CardSet.find_by(name: card.set).id,
    			rarity:       card.rarity,
    			weakness:     card_weakness,
    	  	resistance:   card_resistance,
    			api_id:       card.id
				)

				self.import_attacks(card) if card.attacks
				self.import_ability(card) if card.ability

			end
		end
	end

	def import_attacks(card)
		card.attacks.each do |attack|
			attack_cost = ""
			attack.cost.each do |cost|
				attack_cost += " " + cost
			end
			@attack = ::Attack.create(
				name:    attack.name,
				text:    attack.text,
				damage:  attack.damage,
				cost:    attack_cost,
				card_id: @card.id
			)
		end
	end

	def import_ability(card)
		::Ability.create(
				name: card.ability.name,
				text: card.ability.text,
				ability_type: card.ability.type,
				card_id: @card.id
			)
	end
end