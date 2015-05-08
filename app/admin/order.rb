ActiveAdmin.register Order do

  config.sort_order = 'id_asc'

  permit_params :email, :subtotal, :total, :tax, :paid, :slug

  scope :all, default: true
  scope :paid
  scope :not_paid

  controller do
    defaults finder: :find_by_slug
  end

  index  do
    column :id do |order|
      link_to(order.id, admin_order_path(order))
    end
    column :email
    column :paid
    column :subtotal
    column :total
    column :tax
    column :items do |order|
      order.order_items.count
    end
    column :created_at
    column :updated_at

    actions dropdown: true
  end

  show do
    attributes_table_for order do
      row :id
      row :email
      row :paid
      row :subtotal
      row :total
      row :tax
      row :items
      row :slug
      row :created_at
      row :updated_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :id do |item|
          link_to(item.id, admin_order_order_item_path(order, item))
        end
        column :price
        column :photo
      end
    end
    active_admin_comments
  end

end