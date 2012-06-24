ActiveAdmin.register User do

  index do
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :admin
    column :state
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
      f.input :state, :as => :select, :collection => ([f.object.state] + f.object.state_paths.to_states)
      f.input :admin
    end
    f.inputs "Content" do
    end
    f.buttons
  end

  member_action :approve do
    user = User.find(params[:id])
    user.approve
    user.save!
    redirect_to admin_users_path, :notice => t("approved")
  end
  member_action :reject do
    user = User.find(params[:id])
    user.reject
    user.save!
    redirect_to admin_users_path, :notice => t("rejected")
  end
  action_item :only => :show do
    link_to(t('approve'), approve_admin_user_path(user) )
  end
  action_item :only => :show do
    link_to(t('reject'), reject_admin_user_path(user) )
  end


end
