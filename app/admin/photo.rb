ActiveAdmin.register Photo do

  # belongs_to :marathon, finder: :find_by_slug
  # belongs_to :participant, finder: :find_by_bib
  # belongs_to :marathon, finder: :find_by_slug
  # belongs_to :participant, finder: :find_by_bib, polymorphic: true

  controller do
    # belongs_to :marathon, finder: :find_by_slug
    # belongs_to :participant, finder: :find_by_bib
    # nested_belongs_to :marathon, :participant, finder: :find_by_slug
    def scoped_collection
      super.includes :marathon, :participant
    end
  end

  filter :marathon, collection: Marathon.all.map { |m| [m.name, m.id] }
  filter :participant, collection: Participant.includes(:marathon).all.map { |p| ["#{p.bib} - #{p.marathon.name}", p.id] }

  index do
    column :aws_key
    column :view do |photo|
      preview_link = link_to 'Preview', photo.thumb_url
      original_link = link_to 'Original', photo.original_url
      "#{preview_link} #{original_link}".html_safe
    end
  end

  # permit_params :url, :event_id, :bib_id
  #
  # active_admin_importable do |model, hash|
  #   event = Event.find_by_name(hash[:event])
  #   hash[:event_id] = event.id
  #   hash.delete(:event)
  #   bib = Bib.find_by(number: hash[:bib])
  #   hash[:bib_id] = bib.id
  #   hash.delete(:bib)
  #   model.create!(hash)
  # end
end