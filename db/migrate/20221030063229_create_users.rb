class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.primary_key :uid
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :weight
      t.decimal :height
      t.integer :age
      t.integer :sex
      t.timestamps null: false
    end
  end

end
