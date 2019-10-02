require 'rails_helper'

RSpec.describe User, type: :model do
  # it { should validate_presence_of(:username) }
  # it { should validate_presence_of(:password_digest) }
  # it { should validate_uniqueness_of(:username) }
  # subject(:person) {FactoryBot.create(:user)}
  # it { should validate_length_of(:password).is_at_least(6) }
  
  # it "should validate the presence of user's session_token" do
  #   expect(FactoryBot.create(:user).session_token).to_not be_nil
  # end

  it "should create a password_digest for user via BCrypt" do
    expect(BCrypt::Password).to receive(:create).with('password').and_return("banana")
    user = FactoryBot.build(:user)
    # user = User.create(username: "hello", password: "password")
    expect(user.password).not_to be('password')
  end


  

end
