require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do

  let!(:invoice) {FactoryBot.create(:invoice)}
  let!(:invoice1) {FactoryBot.create(:invoice, reference: "test-abc-xyz", amount: 200)}
  let!(:collection) { FactoryBot.create(:collection, reference: invoice.reference, invoice_id: invoice.id, amount: -100) }
  let!(:collection1) { FactoryBot.create(:collection, reference: invoice1.reference, invoice_id: invoice1.id, amount: -200) }
  

  context "index" do

    it "should list all invoices" do 
      get :index
      expect(response.status).to eq(200)
      expect(assigns(:pending_collections).length).to eq(1)
      expect(assigns(:completed_collections).length).to eq(1)
    end
  end

  context "create invoice" do 

    params = {
      brand_manager: "Vijay",
      customer_name: "Vijay",
      reference:  'test-dsa-e2312-323',
      amount: 1000,
      narration: 'testing'
    }

    invalid_params = {
      brand_manager: "Vijay",
      customer_name: "Vijay",
      amount: 1000,
      narration: 'testing'
    }

    it "should create new invoice" do
      post :create, params: {invoice: params}
      expect(Invoice.count).to eq(3)
    end

    it "should not create new invoice if validations fail" do 
      post :create, params: {invoice: invalid_params}
      expect(Invoice.count).to eq(2)
    end

  end

  context "show" do 

    it "should render invoice" do 
      get :show, params: {id: invoice.id}
      expect(response).to render_template(:show)
    end

  end
end
