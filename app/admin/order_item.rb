ActiveAdmin.register OrderItem do

  belongs_to :order, finder: :find_by_slug

  permit_params :photo, :order, :price

end