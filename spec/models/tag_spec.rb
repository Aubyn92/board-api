require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { build(:tag) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:tag)).to be_valid
end

  it { expect(subject).to validate_presence_of(:name) }
  # it { expect(subject).to validate_length_of(:name).is_at_least(8).is_at_most(75) }
end

  context 'associations' do
  it { expect(subject).to have_many(:posts).through(:post_tags) }
  it { expect(subject).to belong_to(:user) }
 end
end

