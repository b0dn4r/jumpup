ActiveAdmin.register Comment do
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
  permit_params :body, :moderated#, comment_tag_attributes:[:id, :name, :_destroy]

  index do
    selectable_column
    id_column
    column :body
    column :moderated
    column :created_at
    column :post
    column :user
    column :comment_tags do |i|
      i.comment_tags.map{|a| a.name}
    end
    actions
  end

  show do
    panel "Comments" do
      table_for comment do
        column :body
        column :moderated
        column :user
        column :comment_tags do |i|
          i.comment_tags.map{|a| a.name}
        end
      end
    end
    # active_admin_comments
  end


end
