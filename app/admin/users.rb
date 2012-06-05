ActiveAdmin.register User do

  index do
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :admin
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :email, :as => :email
      f.input :password, :as => :password
      f.input :password_confirmation, :as => :password
      f.input :phone_number, :as => :phone
      f.input :admin
    end
    f.inputs "Content" do
    end
    f.buttons
  end


end
