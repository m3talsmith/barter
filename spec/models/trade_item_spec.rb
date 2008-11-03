require File.dirname(__FILE__) + '/../spec_helper'

describe TradeItem do
  before(:each) do
    @trade_item = TradeItem.new
  end

  it "should be valid" do
    @trade_item.should be_valid
  end
end
