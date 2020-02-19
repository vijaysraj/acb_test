require 'rails_helper'

RSpec.describe Collection, type: :model do
  context "check validations" do 

    it "should validate presence of all fields" do 
      collection = Collection.new
      collection.valid?

      expect(collection.errors[:amount]).to include("can't be blank")
      expect(collection.errors[:reference]).to include("can't be blank")

    end

  end
end
