class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :resource_summary
      t.integer :issue_id
      t.string :resource_url

      t.timestamps

    end
  end
end
