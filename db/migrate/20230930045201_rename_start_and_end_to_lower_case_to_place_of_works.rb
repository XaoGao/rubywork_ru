class RenameStartAndEndToLowerCaseToPlaceOfWorks < ActiveRecord::Migration[7.0]
  def change
    rename_column :place_of_works, :Start, :started_at
    rename_column :place_of_works, :End, :ended_at
  end
end
