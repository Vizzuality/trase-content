ActiveAdmin.register Post do
  permit_params :title, :date, :image, :post_url, :state, :description

  form do |f|
    f.semantic_errors
    inputs do
      input :title, :required => true
      input :date, :as => :date_select, :required => true, :label => 'Publishing date'
      input :image, :as => :file
      input :post_url, :required => true
      input :state, :as => :boolean, :label => 'Published?'
      input :description, :as => :ckeditor
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :date
      row :image do |post|
        image_tag post.image.url(:medium)
      end
      row :post_url
      row('Published?') { |post| status_tag post.state == 1 }
      row :description do |post|
        post.description.html_safe
      end
    end
  end

end
