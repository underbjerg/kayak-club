ActiveAdmin.register EventOccurrence do

  index do
    column :event
    column :start_at
    column :end_at
    column :description
    column "Registrations" do |occ|
      occ.event_registrations.count
    end
    default_actions
  end

  show do |f|
    attributes_table do
      row :event
      row :start_at
      row :end_at
      row :description
    end

    panel("Event registrations") do
      table_for(f.event_registrations) do
        column "User" do |item|
          link_to item.user.full_name, [:admin, item.user]
        end
        column "Phone" do |item|
          item.user.phone_number
        end
        column "Email" do |item|
          item.user.email
        end
      end
    end


    active_admin_comments
  end


  form do |f|
    f.inputs do
      f.input :event #, :input_html => { :disabled => true }
      f.input :start_at
      f.input :end_at
      f.input :description, :hint => "Use this to provide special info about this particular occurrence of the event"
    end


    f.buttons
  end

end
