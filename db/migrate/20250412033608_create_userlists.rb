class CreateUserlists < ActiveRecord::Migration[8.0]
  def change
    create_table :userlists do |t|
      t.string :username
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
