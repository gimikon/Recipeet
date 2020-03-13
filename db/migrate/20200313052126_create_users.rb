class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :username
      t.text :gender
      t.integer :age
      t.text :bio
      t.timestamps
    end
  end
end
