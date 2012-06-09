ActiveAdmin.register EventOccurrence do

  index do
    column :event
    column :start_at
    column :end_at
    column :description
    default_actions
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
