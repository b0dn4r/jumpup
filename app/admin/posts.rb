ActiveAdmin.register Post do
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
  permit_params :name, :active, :comment, :keywords, :body, :category_id, :url,
                :post_image_id, :title, :post_type_id, tag_ids:[], post_images_attributes:[:id, :img, :_destroy]

  scope :all, default: true
  scope :is_active
  scope :not_active

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :active
    column :category
    column :tags
    column :post_types
    column :post_images do |i|
      i.post_images.map{|a| image_tag(a.img.url(:thumb), size: 70)}
    end
    actions
  end

  form :html => {:multipart => true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :active
      f.input :name
      f.input :url
      f.input :category
      f.input :tags
      f.input :post_types
      f.input :comment
      f.input :title
      f.input :keywords
      f.input :body
    end
    f.actions

  f.inputs do
    f.has_many :post_images do |gal|
      gal.input :img, :as => :file, required: false, :label => "Картинка ", hint:  f.image_tag(gal.object.img.url(:medium)).html_safe
      gal.input :_destroy, as: :boolean, required: false, label: 'Удалить'
    end
  end
  f.actions
end

end
