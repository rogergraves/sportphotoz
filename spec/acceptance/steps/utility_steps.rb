require 'rails_helper'

module UtilitySteps

  step 'I am on home page' do
    visit '/'
  end

  step 'I am on page :url' do |url|
    visit url
  end

  step 'I click on link :link' do |link|
    click_link link
  end

  step 'the page should show :content' do |content|
    expect(page).to have_content content
  end

end

RSpec.configure { |c| c.include UtilitySteps }