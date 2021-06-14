# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  # it 'validates name' do 
  #   should validate_presence_of :name
  # end

  # it 'validates price' do 
  #   should validate_numericality_of :price
  # end

  # it 'have_many' do
  #   should have_many :positions
  #   should have_many :comments
  #   should have_many :carts
  # end

  # it 'has_one' do
  #   should have_one :image
  # end

  it { should validate_presence_of :name }
  it { should validate_numericality_of :price }
  it { should have_many :positions }
  it { should have_many :comments }
  it { should have_many :carts }
  it { should have_one :image }


  context "calculate the price" do
    let!(:item_1) { create :item, price: 10 }
    let!(:item_2) { create :item, price: 20 }
    let!(:order) { create :order }
    it 'calculate the price' do
      # item1 = Item.new(price: 10)
      # item2 = Item.new(price: 20)
      order = Order.new
      order.items << item_1
      order.items << item_2
  
      expect(order.calculate_total).to be 30.0
    end
  end
end
