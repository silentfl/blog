class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :content
      t.datetime :published_at, index: true

      t.timestamps null: false
    end
  end
end
