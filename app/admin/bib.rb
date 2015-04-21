ActiveAdmin.register Bib do


  permit_params :number
  
  active_admin_importable do |model, hash|
    model.create!(hash)
  end

end
