require('date')

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :dob, :gender, :image, :name, :role_id

  index do
    selectable_column
    id_column
    column "Full name", :name
    column :email
    column "Date of birth", :dob
    column("User type", :role)
    column :image do |user|
      image_tag(user.image.thumb)
    end
    column :gender
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :gender
  filter :dob
  filter :role, :as => :check_boxes, collection: proc {Role.all.pluck(:name, :id)}
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Admin Details" do
      f.input :email, :required => true
      f.input :name, :required => true
      f.input :role, :as => :radio, :collection => Role.pluck(:name, :id), :required => true
      f.input :dob, :as => :datepicker, start_date: Date.parse("1900-1-1"), end_date: Date.today, :required => true
      f.input :gender, :as => :radio,:collection => [['Male','Male'],['Female','Female']], :required => true
      f.input :image, :as => :file, :required => true, :hint => f.object.image.present? ? image_tag(f.object.image.url(:thumb)) : content_tag(:span, "no image yet")
      # f.input :password, :required => true
      # f.input :password_confirmation, :requried => true
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :image do
        image_tag(ad.image.url(:thumb))
      end

      row :name
      row :email
      row("User type", :role) {|role_type| role_type.role.name}
      row :gender
      row  :dob

    end
  end


end
