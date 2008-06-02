require File.dirname(__FILE__) + '/../spec_helper'

describe Item do
  before(:each) do
    @item = Item.new
  end

  it "should be valid" do
    @item.should be_valid
  end
end
