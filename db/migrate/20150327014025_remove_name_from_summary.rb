class RemoveNameFromSummary < ActiveRecord::Migration
  def change
    remove_column :summaries, :name, :string
  end
end
