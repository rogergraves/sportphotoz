ActiveAdmin.register Event do

  permit_params :path, :name, :description
  
end
