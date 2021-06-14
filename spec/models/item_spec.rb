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


  it 'calculate the price' do
    item1 = Item.new(price: 10)
    item2 = Item.new(price: 20)

    order = Order.new
    order.items << item1
    order.items << item2

    order.calculate_total

    expect(order.total).to be 30.0
  end
end
