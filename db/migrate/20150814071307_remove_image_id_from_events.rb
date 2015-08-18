class RemoveImageIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :image_id, :string
  end
end
