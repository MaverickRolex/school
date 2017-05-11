ActiveAdmin.register Group do
  permit_params :grade, :group, :class_room, :user_id

  index do
    selectable_column
    id_column
    column :grade
    column :group
    column :class_room
    column "Counselor", :user_id do |group|
      group.user.user_name
    end
#      link_to user.department.department, admin_department_path(user.department)
    actions
  end

  filter :grade
  filter :group
  filter :class_room
  filter :user_id, as: :select, 
          collection: Group.all.map {|group| [group.user.user_name, group.id]}

  form do |f|
    f.inputs "Admin Details" do
      f.input :grade
      f.input :group
      f.input :class_room
      f.input :user_id, as: :select, 
              collection: User.all.map {|user| [user.user_name, user.id]} 
    end
    f.actions
  end

end
