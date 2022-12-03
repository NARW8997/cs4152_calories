class ChangeDataTypeForGoalWeight < ActiveRecord::Migration
  def change
    change_column(:users, :goal_weight, :decimal)
  end
end
