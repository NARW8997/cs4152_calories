class AddColorie < ActiveRecord::Migration
  def change
    add_column :users, :daily_calorie, :integer
  end
end
