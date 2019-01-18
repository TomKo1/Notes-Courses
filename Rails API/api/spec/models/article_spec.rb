require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '#validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }


    it 'should test that the factory is valid' do
      expect(FactoryBot.build :article).to be_valid
    end
  end

  describe '.recent' do
    it 'should list recent article first' do
      old_article = create :article
      newer_article = create :article
      expect(described_class.recent).to eq(
        [ newer_article, old_article ]
      )
      old_article.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
        [ old_article, newer_article ]
      )
    end
  end
end
