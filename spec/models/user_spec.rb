require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(subject).to validate_presence_of(:username) }
  it { expect(subject).to have_secure_password }
  it { expect(subject).to validate_presence_of(:email) }
end
