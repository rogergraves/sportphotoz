require 'rails_helper'

RSpec.describe Marathon, type: :model do

  context "Relationships" do
    it { should have_many(:participants) }
    it { should have_many(:photos) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:aws_prefix) }

    it 'enforces uniqueness of :slug' do
      expect(create(:marathon)).to validate_uniqueness_of(:slug)
    end

    it 'enforces uniqueness of :aws_prefix' do
      expect(create(:marathon)).to validate_uniqueness_of(:aws_prefix)
    end
  end

  context "Factories" do
    it "works" do
      expect(create(:marathon)).to be_valid
    end
  end

  context "Instance methods" do
    it "#participant" do
      target_participant = create(:participant)
      another_participant = create(:participant)
      marathon = target_participant.marathon
      expect(marathon.participant(target_participant.bib)).to eq(target_participant)
    end
  end

  context "Class methods" do
  end
end