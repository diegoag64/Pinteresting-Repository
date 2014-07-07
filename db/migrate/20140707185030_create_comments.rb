class CreateComments < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.integer :pin_id
      t.text :body

      t.timestamps
    end
    add_index :comments, :pin_id

    drop_table :comments
  end
end
