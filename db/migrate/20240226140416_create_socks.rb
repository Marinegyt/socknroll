class CreateSocks < ActiveRecord::Migration[7.1]
  def change
    create_table :socks do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :state
      t.string :color
      t.integer :size
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
