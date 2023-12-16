class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vacancy, null: false, foreign_key: true
      t.datetime :readed_at
      t.text :cover_letter

      t.timestamps
    end
  end
end
