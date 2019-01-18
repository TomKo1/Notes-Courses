require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#validations' do
  end

  describe '#new' do
    it 'should have a token present after initialize' do
      expect(AccessToken.new.token).to be_present
    end

    it 'should create uniq token' do
      user = create :user
      expect{ user.create_access_token }.to change{ AccessToken.count }.by(1)
      expect(user.build_access_token).to be_valid
    end
  end

end