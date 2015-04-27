require 'rails_helper'

RSpec.describe Event, type: :model do

  context "Relationships" do
    it { should have_many(:photos) }
  end

  context "Validations" do
  end

  context "Factories" do
    it "works" do
      expect(create(:event)).to be_valid
    end
  end

  context "Instance methods" do
  end

  context "Class methods" do
  end

end
