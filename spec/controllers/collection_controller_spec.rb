require 'rails_helper'

RSpec.describe CollectionController, type: :controller do

  let!(:invoice) { FactoryBot.create(:invoice) }
	context "create collections" do 

    it "should create new collection" do
      post :create, params: {collection: {reference: invoice.reference, amount: 1000}, invoice_id: invoice.id}
      expect(Collection.count).to eq(1)
    end

  end
end
