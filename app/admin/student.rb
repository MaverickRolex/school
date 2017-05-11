ActiveAdmin.register Student do

  index do
    selectable_column
    id_column
    column :student_name
    column :tutor_name
    column :address
    column :phone
    column :group_id do |student|
      student.group.grade_group
    end
#      link_to user.department.department, admin_department_path(user.department)
    actions
  end

  filter :student_name
  filter :tutor_name
  filter :group_id, as: :select, 
          collection: Group.all.map {|group| [group.grade_group, group.id]}

  form do |f|
    f.inputs "Admin Details" do
      f.input :student_name
      f.input :tutor_name
      f.input :address
      f.input :phone
      f.input :group_id, as: :select, 
              collection: Group.all.map {|group| [group.grade_group, group.id]}
    end
    f.actions
  end

  show do
    h3 student.student_name
    attributes_table do
      row :tutor_name
      row :address
      row :phone
      row :group_id do |student|
        student.group.grade_group
      end
    end
  end

end
