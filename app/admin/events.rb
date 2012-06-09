ActiveAdmin.register Event do

  show do |f|
    attributes_table do
      row :name
      row :location
      row :description
    end

    panel("Event occurrences") do
      table_for(f.event_occurrences) do
        column "Time" do |item|
          link_to item.time_to_s, [:admin, item]
        end
        column "Description" do |item|
          item.description
        end
        column "Registrations" do |item|
          item.event_registrations.count
        end
      end
    end


    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :location
      f.input :description
    end

    #f.inputs "Occurrences" do
    #  f.has_many :event_occurrences do |j|
    #    j.input :start_at
    #    j.input :end_at
    #  end
    #end


    f.buttons
  end

end
