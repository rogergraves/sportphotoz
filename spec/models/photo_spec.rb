require 'rails_helper'

RSpec.describe Photo, type: :model do

  context "Relationships" do
    it { should belong_to(:participant) }
    it { should belong_to(:marathon) }
  end

  context "Validations" do
    it { should validate_presence_of(:aws_key) }
    it { should validate_presence_of(:marathon_id) }

    it 'enforces uniqueness of :aws_key' do
      expect(create(:photo)).to validate_uniqueness_of(:aws_key)
                                    .scoped_to(:marathon_id)
                                    .with_message('should be once per marathon')
    end
  end

  context "Factories" do
    it "works" do
      expect(create(:photo)).to be_valid
    end
  end

  context "Instance methods" do
  end

  context "Class methods" do
  end

end
