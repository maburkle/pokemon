class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
    	t.string :name
      t.string :image_url
      t.string :hd_image_url
      t.string :hp
      t.string :energy_types
      t.string :card_number
      t.string :sub_type
      t.string :super_type
    	t.string :flavor_text
    	t.integer :evloves_from_id
    	t.integer :evolves_to_id
    	t.integer :retreat_cost
    	t.string :artist
    	t.integer :set_id
    	t.string :rarity
    	t.string :weakness
    	t.string :resistance
    	t.string :api_id
    end
    create_table :attacks do |t|
    	t.string :cost
    	t.string :name
    	t.text   :text
    	t.string :damage
    	t.integer :card_id
    end
    create_table :ability do |t|
    	t.string :name
      t.text   :text
      t.text   :ability_type
      t.integer :card_id
    end
  end
end
