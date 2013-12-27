require 'test_helper'

class Item
  include ActiveModel::Model
  include ActsAsPriceable

  attr_accessor :fee_cents
  acts_as_priceable :fee, :suffix => 'cents'

  attr_accessor :price_in_cents
  acts_as_priceable :price, :class => BigDecimal

  attr_accessor :charge_in_cents
  acts_as_priceable :charge
end

describe Item do
  let :item do
    Item.new :fee => 10, :price_in_cents => 200
  end

  describe '#fee' do
    it 'can fetch fee' do
      item.fee.must_equal 10
    end

    it 'should be an instance of BigDecimal' do
      item.fee.must_be_instance_of BigDecimal
    end

    it 'can be assigned a fee' do
      item.fee = 5
      item.fee.must_equal 5
    end

    it 'should change fee_cents when assign a new fee' do
      item.fee = 5
      item.fee_cents.must_equal 500
    end
  end

  describe '#fee_cents' do
    it 'can fetch cents' do
      item.fee_cents.must_equal 1000
    end

    it 'should change price when assign a new fee_cents' do
      item.fee_cents = 3000
      item.fee.must_equal 30
    end
  end

  describe '#price' do
    it 'should be an instance of BigDecimal' do
      item.price.must_be_instance_of BigDecimal
    end
  end

  describe '#charge' do
    it 'should be nil' do
      item.charge.must_be_nil
    end
  end
end
