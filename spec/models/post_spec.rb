require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:post)).to be_valid
end

    it { expect(subject).to validate_presence_of(:title) }
    # it { expect(subject).to validate_length_of(:title).is_at_least(8).is_at_most(75) }
    # it { expect(subject).to validate_presence_of(:image_url) }
    it { expect(subject).to validate_presence_of(:description) }
end

  context 'associations' do
    it { expect(subject).to have_many(:tags).through(:post_tags) }
    it { expect(subject).to have_many(:comments).through(:post_comments) }
    it { expect(subject).to belong_to(:user) }
 end
end