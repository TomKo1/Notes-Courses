require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'should have valid factory' do
      user = build :user
      expect(user).to be_valid
    end

    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:provider) }
    it { should validate_uniqueness_of(:login) }
  end
end
