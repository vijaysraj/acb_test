require 'rails_helper'

RSpec.describe Invoice, type: :model do

  let!(:invoice) {FactoryBot.create(:invoice)}
  let!(:invoice1) {FactoryBot.create(:invoice, reference: "test-abc-xyz", amount: 200)}
  let!(:collection) { FactoryBot.create(:collection, reference: invoice.reference, invoice_id: invoice.id, amount: -100) }
  let!(:collection1) { FactoryBot.create(:collection, reference: invoice1.reference, invoice_id: invoice1.id, amount: -200) }

  context "check validations" do 

    it "should validate presence of all fields" do 
      invoice = Invoice.new
      invoice.valid?

      expect(invoice.errors[:customer_name]).to include("can't be blank")
      expect(invoice.errors[:reference]).to include("can't be blank")
      expect(invoice.errors[:brand_manager]).to include("can't be blank")
      expect(invoice.errors[:amount]).to include("can't be blank")
      expect(invoice.errors[:reference]).to include("can't be blank")

    end

  end

  context ".pending_collections" do

    it "should list all the pending_collections" do 
      expect(described_class.pending_collections.length).to eq(1)
    end
  end

  context ".completed_collections" do 
    it "should list all the completed_collections" do 
      expect(described_class.completed_collections.length).to eq(1)
    end
  end
end
