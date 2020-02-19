class Collection < ApplicationRecord
  belongs_to :invoice

  before_save :add_collection_date

  validates_presence_of :reference
  validates_presence_of :amount

  def add_collection_date
    self.collection_date = Date.today.strftime("%Y-%m-%d")
  end
end
