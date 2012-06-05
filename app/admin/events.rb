ActiveAdmin.register Event do

  show do |f|
    attributes_table do
      row :name
      row :location
      row :description
      f.event_occurrences.each do |occ|
        row :event_occurrence do
          occ.time_to_s
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

    f.inputs "Occurrences" do
      f.has_many :event_occurrences do |j|
        j.input :start_at
        j.input :end_at
      end
    end

    f.buttons
  end

end
