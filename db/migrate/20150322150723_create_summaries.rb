class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :name
      t.text :body

      t.timestamps null: false
    end
  end
end
