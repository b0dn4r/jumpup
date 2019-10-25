ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
  permit_params :name, :active, :url, :img

  scope :all, default: true
  scope :is_active
  scope :not_active

  form :html => {:multipart => true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :active
      f.input :name
      f.input :url
      f.input :img, as: :file, required: false, :label => "Картинка ", hint:  f.image_tag(f.object.img.url(:medium)).html_safe
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :active
    column :img do |tm|
      image_tag tm.img.url(:thumb), width: 80
    end
    actions
  end

end
