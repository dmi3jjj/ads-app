require 'spec_helper'

describe User do
  before { @user = User.new(phone: "0806923281") }
  subject { @user }

  it { should respond_to(:phone) }
  it { should be_valid }

  describe "when phone is not present" do
    before { @user.phone = " " }
    it { should_not be_valid }
  end
  describe "when phone format is invalid" do
    it "should be invalid" do
      phones = %w[0806555 1111,22234 112233445m 123456789999]
      phones.each do |f|
        @user.phone = f
        @user.should_not be_valid
      end
    end
  end

  describe "when phone format is valid" do
    it "should be valid" do
      phones = %w[0806923281 080612345]
      phones.each do |f|
        @user.phone = f
        @user.should be_valid
      end
    end
  end
       
  describe "when phone is not unique" do
    before do
      another_user = User.new(phone: "0806923281")
      another_user.save
    end
    it { should_not be_valid }
  end
end
