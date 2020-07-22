require 'rails_helper'

RSpec.describe PostComment, type: :model do
  it { should belong_to(:comment) }

#   context 'validations' do
#     it 'has a valid factory' do
#       expect(build(:post_comment)).to be_valid
#   end
# end

context 'associations' do
  it { expect(subject).to belong_to(:post) }
  it { expect(subject).to belong_to(:comment) }
  # it { should belong_to(:tag) }
  end
end

