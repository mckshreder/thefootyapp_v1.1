class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :location
      t.string :info
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :users
  end
end
