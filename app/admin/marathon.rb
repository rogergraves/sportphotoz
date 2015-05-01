ActiveAdmin.register Marathon do

  permit_params :name, :slug, :aws_prefix, :event_date, :active

  controller do
    defaults finder: :find_by_slug

    after_create do |marathon|
      marathon.fill_up
    end


    # def scoped_collection
    #   super.includes :participants
    # end
  end

  filter :none

  index do
    column :name
    actions
  end



  # show do
  #   h3 marathon.name
  #   # div do
  #   #   simple_format post.body
  #   # end
  # end

  show do
    attributes_table do
      row :name
      row :slug
      row :aws_prefix
      row :event_date
      row :active
      row :participants do |marathon|
        participants = marathon.participants
        link_to "Participants (#{participants.count})", admin_marathon_participants_path(marathon)
      end
      row :photos do |marathon|
        photos = marathon.photos
        link_to "Photos (#{photos.count})", admin_photos_path
      end


      # row :image do
      #   image_tag ad.image.url
      # end
    end
    active_admin_comments
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
