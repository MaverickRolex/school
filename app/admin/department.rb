ActiveAdmin.register Department do
  permit_params :department, :description

  index do
    selectable_column
    id_column
    column :department
    column :description
    actions
  end

  filter :department
  filter :description

  show do
    h3 department.department
    attributes_table do
      row :description
    end
  end

end
