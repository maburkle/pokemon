class CreateSetsAndSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :card_sets do |t|
    	t.string   :name
    	t.integer  :series_id
    	t.string   :release_date
    	t.string   :symbol_image_url
    	t.string   :logo_image_url
    	t.integer  :total_cards
        t.string   :set_api_name
        t.timestamps
    end

    create_table :series do |t|
    	t.string   :name
    	t.string   :logo_image_url
    end
  end
end
