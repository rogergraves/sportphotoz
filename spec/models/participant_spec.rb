require 'rails_helper'

RSpec.describe Participant, type: :model do

  context "Relationships" do
    it { should have_many(:photos) }
    it { should belong_to(:runner) }
    it { should belong_to(:marathon) }
  end

  context "Validations" do
    it { should validate_presence_of(:bib) }
    it { should validate_presence_of(:marathon) }
    # it { should validate_presence_of(:runner) }

    it 'enforces uniqueness of :bib' do
      expect(create(:participant)).to validate_uniqueness_of(:bib).scoped_to(:runner_id, :marathon_id).with_message('The runner with same bib already taking part on marathon')
    end
  end

  context "Factories" do
    it "works" do
      expect(create(:participant)).to be_valid
    end
  end

  context "Instance methods" do
  end

  context "Class methods" do
  end
end