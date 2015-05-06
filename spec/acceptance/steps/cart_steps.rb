require 'rails_helper'

module CartSteps

  step 'I buy :photo photo' do |photo|
    photo = photo.split('.')[0...-1].join('.').capitalize
    find("img[alt='#{photo}'] + .polaroid-btns").find("input[value='Add to Cart']").click
  end

  step 'I should see :photos_count in the cart' do |photos_count|
    expect(page).to have_selector('.cart-item', count: photos_count.to_i)
  end

  step 'I should see :photo photo in the cart' do |photo|
    photo = photo.split('.')[0...-1].join('.').capitalize
    expect(page).to have_selector("img[alt='#{photo}']")
  end
end

RSpec.configure { |c| c.include CartSteps }