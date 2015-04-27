require 'rails_helper'

RSpec.describe Bib, type: :model do

  context "Relationships" do
    it { should have_many(:photos) }
  end

  context "Validations" do
    it { should validate_uniqueness_of(:number) }
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
