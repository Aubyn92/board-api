require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { expect(subject).to validate_presence_of(:name) }

  context 'associations' do
    it { expect(subject).to have_many(:posts).through(:post_tags) }
 end
end
