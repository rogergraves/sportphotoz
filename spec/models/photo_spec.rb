require 'rails_helper'

RSpec.describe Photo, type: :model do

  context "Relationships" do
    it { should belong_to(:bib) }
    it { should belong_to(:event) }
  end

  context "Validations" do
    it { should validate_uniqueness_of(:url) }
  end

  context "Factories" do
    it "works" do
      expect(create(:bib)).to be_valid
    end
  end

  context "Instance methods" do
  end

  context "Class methods" do
  end

end
