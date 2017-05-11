ActiveAdmin.register User, as: "Personal" do
  permit_params :user_name, :address, :phone, :department_id, :department_boss, 
                :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :user_name
    column :address
    column :phone
    column :department_id do |user|
      link_to user.department.department, admin_department_path(user.department)
    end
    column :department_boss
    actions
  end

  filter :user_name
  filter :email
  filter :department_boss, as: :check_boxes
  filter :department_id, as: :select, 
          collection: Department.all.map {|department| [department.department, department.id]}

  form do |f|
    f.inputs "Admin Details" do
      f.input :user_name
      f.input :address
      f.input :phone
      f.input :department_id, as: :select, 
              collection: Department.all.map {|department| [department.department, department.id]} 
      f.input :department_boss
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    h3 user.user_name
    attributes_table do
      row :address
      row :phone
      row :department_id do |user|
        user.department.department
      end
      row :department_boss
      row :email
    end
  end

end
