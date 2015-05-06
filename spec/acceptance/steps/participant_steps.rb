require 'rails_helper'

module ParticipantSteps

  step 'Participant with BIB :bib exists and takes part in marathon :marathon' do |bib, marathon|
    p = create(:participant, bib: bib, marathon: Marathon.find_by(name: marathon))
  end

  step 'Participant with BIB :bib has :photos_count photos' do |bib, photos_count|
    participant = Participant.find_by(bib: bib)
    create_list(:photo, photos_count.to_i, participant: participant, marathon: participant.marathon)
  end

  step 'Participant with BIB :bib has a photo with name :name' do |bib, name|
    participant = Participant.find_by(bib: bib)
    create(:photo, aws_key: name, participant: participant, marathon: participant.marathon)
  end

  step 'I should see :photos_count photos' do |photos_count|
    expect(page).to have_selector('.polaroid', count: photos_count.to_i)
    # page.execute_script("$('.polaroid').size();");
  end

end

RSpec.configure { |c| c.include ParticipantSteps }