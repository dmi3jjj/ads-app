require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Contact page" do
    before { visit contact_path }

    it { should have_title ("WheelTrader | Contact") }
    it { should have_content ("ddd@ddd.com") }
  end
end
