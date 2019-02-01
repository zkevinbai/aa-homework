require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  it "should validate password length is > 3" do
			green_capy = User.new(email: "deb", password: "greene")
			green_capy.valid?
			expect(green_capy_errors[:error]).to eq(["Password must be 3 characters or longer"])
		end
end
