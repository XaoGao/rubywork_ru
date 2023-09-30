class CreatePlaceOfWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :place_of_works do |t|
      t.datetime :Start, null: false
      t.datetime :End, null: true
      t.string :company, null: false
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
