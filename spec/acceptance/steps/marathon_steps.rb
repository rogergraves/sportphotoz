require 'rails_helper'

module MarathonSteps

  step 'Marathon :name exists and has a slug :slug' do |name, slug|
    create(:marathon, name: name, slug: slug)
  end

end

RSpec.configure { |c| c.include MarathonSteps }