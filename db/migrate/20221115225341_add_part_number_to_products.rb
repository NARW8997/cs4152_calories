class AddPartNumberToProducts < ActiveRecord::Migration
  def change
    add_column :users, :goal_weight, :integer
    add_column :users, :days, :integer
    add_column :users, :user_type, :string
  end
end
