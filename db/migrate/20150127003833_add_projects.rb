class AddProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.column(:name, :varchar)
      t.column(:employee_id, :integer)
      t.timestamps
    end
  end
end
