require 'rails_helper'

RSpec.describe PostTag, type: :model do
  # subject { build(:post_tags) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:post_tag)).to be_valid
  end
end

context 'associations' do
  it { expect(subject).to belong_to(:post) }
  it { expect(subject).to belong_to(:tag) }
  # it { should belong_to(:tag) }
end
end
