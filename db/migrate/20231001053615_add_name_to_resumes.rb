class AddNameToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :name, :string, null: false, default: ""
  end
end
