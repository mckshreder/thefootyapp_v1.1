class RemoveArtistFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :artist, :string
  end
end
