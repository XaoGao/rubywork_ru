class AddStatusToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :status, :integer, default: 0
  end
end
