class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.decimal :balance
      t.timestamps
    end
  end

end


#create users table to inherit active record
#table has user username, password, balance, and timestamps
