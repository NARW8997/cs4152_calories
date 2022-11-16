class CreateRestaurant < ActiveRecord::Migration
  def change
    create_table :restaurants, id: false do |t|
      t.string :name
      t.primary_key :id
      t.string :cal_type
      t.string :location
    end
  end
end
