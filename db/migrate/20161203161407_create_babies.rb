class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :name
      t.datetime :birthdate
      t.integer :user_id

      t.timestamps

    end
  end
end
