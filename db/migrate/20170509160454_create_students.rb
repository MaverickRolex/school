class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :student_name
      t.string :tutor_name
      t.string :address
      t.string :phone
      t.integer :group_id
      t.timestamps
    end
  end
end
