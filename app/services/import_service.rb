class ImportService
	require 'pokemon_tcg_sdk'

	#Pass a Pokemon's National Pokedex number to import all cards, attacks, and abilities, associated with that Pokemon

	def self.import_card(card_number)
		cards = Pokemon::Card.where(nationalPokedexNumber: card_number)
		cards.each do |card|
			unless Card.find_by(api_id: card.id)
				evolve_from_id = card.evolvesFrom ? Card.where(name: card.evolvesFrom).first.id : 0
				evolve_to_id   = card.evolvesTo ? Card.where(name: card.evolvesTo).first.id || 200 : 0
				@card = Card.create(
					name: 				card.name,
      		image_url: 		card.imageUrl,
      		hd_image_url: card.imageUrlHiRes,
      		hp: 					card.hp,
      		energy_types: card.types,
      		card_number: 	card.number,
      		sub_type: 		card.subtype,
      		super_type: 	card.supertype,
    			flavor_text:  card.text,
    			retreat_cost: card.retreatCost,
    			artist:       card.artist,
    			set_id:       Set.find_by(name: card.set),
    			rarity:       card.ratity,
    		#	weakness:
    	  # resistance:
    			api_id:       card.id
				)

				card.attacks.each do |attack|

				end

				Ability.create(
					name: card.ability.name,
					text: card.ability.text,
					ability_type: card.ability.type,
					card_id: @card.id
				)
			end
		end
	end

	#Imports all Sets and Series from the api

	def self.import_set
		sets = Pokemon::Set.all
		sets = sets.sort_by { |obj| Date.strptime(obj.release_date, "%m/%d/%Y") }
		sets.each do |set|
			if set.name == set.series
				series = ::Series.create(name: set.name, logo_image_url: set.logo_url)
			else
				series = ::Series.find_by(name: set.series)
				series = ::Series.create(name: set.series, logo_image_url: set.logo_url) unless series
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
end