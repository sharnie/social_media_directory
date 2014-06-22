class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :website
      t.string :profile_picture
      t.string :full_name
      t.string :bio
      t.string :instagram_id

      t.timestamps
    end
  end
end