class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :post, foreign_key: true
      t.integer :parent_id
      t.integer :rgt
      t.integer :lft

      t.timestamps null: false
    end

    add_reference :posts, :category, index: true
  end
end
