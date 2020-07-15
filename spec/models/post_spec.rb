require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { 
    Post.new(
    title: 'I love cooking',
    description: 'My lovely wee Moroccan dish',
    image_url: 'https://www.google.com/search?q=moroccan+dish&rlz=1C5CHFA_enAU907AU907&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjz34iUjc7qAhVNVisKHTilCe8Q_AUoAXoECBAQAw&biw=705&bih=855'
  )
}

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