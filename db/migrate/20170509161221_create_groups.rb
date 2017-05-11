class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :grade
      t.string :group
      t.integer :class_room
      t.timestamps
    end
  end
end
