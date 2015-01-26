class AddDivisions < ActiveRecord::Migration
  def change
    create_table(:divisions) do |t|
     t.column(:name, :varchar)
     t.timestamps
    end
    add_column(:employees, :division_id, :integer)
  end
end
