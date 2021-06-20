require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
   # need to create item
   # rspec render views and after that checkin
    render_views
  
   describe "GET #show" do
    let(:items) {create_list :item, 5}

    before { get :index }

    it 'returns items' do
      binding.pry #in binding type items to see items factory
      # check the variable contain array items, where is here  array
      expect(assigns(:items)).to match_array items  
    end
  end
  describe "DELETE #destroy" do
    
  end 
end
