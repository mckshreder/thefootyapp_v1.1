class AddLocationValueToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :location_value, :string
  end
end
