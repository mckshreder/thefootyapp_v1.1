class RemoveLatAndLngAndLocationValueFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :lat, :float
    remove_column :posts, :lng, :float
    remove_column :posts, :location_value, :string
  end
end
