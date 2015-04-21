ActiveAdmin.register Photo do
  
  permit_params :url, :event_id, :bib_id

  active_admin_importable do |model, hash|
    event = Event.find_by_name(hash[:event])
    hash[:event_id] = event.id
    hash.delete(:event)
    bib = Bib.find_by(number: hash[:bib])
    hash[:bib_id] = bib.id
    hash.delete(:bib)
    model.create!(hash)
  end
end