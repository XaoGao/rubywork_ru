class CreateVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancies do |t|
      t.string :title, null: false, default: ""
      t.text   :body,  null: false, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
