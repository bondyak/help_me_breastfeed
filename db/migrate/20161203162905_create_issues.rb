class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issue_summary
      t.integer :min_age
      t.integer :max_age

      t.timestamps

    end
  end
end
