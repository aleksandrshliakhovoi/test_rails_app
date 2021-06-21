require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
   # need to create item
   # rspec render views and after that checkin
  render_views

  let(:items) { create_list :item, 5 } # every test can use it
  let(:item)  { create :item }

  let(:items_params) do
    #item at start is for strong params (require)
    {item:{
        name: 'car',
        price: 50,
        description: 'black'
      }
    }
  end

  context "GET #show" do #context instead of describe
    before { get :index }

    it 'returns items' do
      is_expected.to render_template :index # we are really go to endpoint index
      #binding.pry #in binding type items to see items factory
      # check the variable contain array items, where is here  array
      expect(assigns(:items)).to match_array(items)
    end
  end
 
  context "POST #create" do
    subject { post :create, params: items_params }

    it 'saves the item' do
      expect { subject }.to change(Item, :count).by 1 #model item should change the quantity
      is_expected.to render_template :create #check route
    end
  end
end
