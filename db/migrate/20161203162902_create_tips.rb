class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :tips_summary
      t.integer :min_age
      t.integer :max_age

      t.timestamps

    end
  end
end
