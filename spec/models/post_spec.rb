require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
end

it 'is not valid without a title' do
  subject.title = nil
  expect(subject).to_not be_valid
end

it 'is not valid without an image_url' do
  subject.image_url = nil
  expect(subject).to_not be_valid
end
end
end