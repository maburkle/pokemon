class CreateUserCards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cards do |t|
    	t.belongs_to :user
    	t.belongs_to :card
    	t.integer    :quantity
    	t.integer    :foil_quantity
    end
  end
end
