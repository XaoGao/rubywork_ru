class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :sender, null: false
      t.references :recipient, null: false
      t.text :body
      t.datetime :read_at

      t.timestamps
    end

    add_foreign_key :notifications, :users, column: :sender_id
    add_foreign_key :notifications, :users, column: :recipient_id
  end
end
