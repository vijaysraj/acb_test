class Invoice < ApplicationRecord

  has_many :collections

  before_save :add_invoice_date

  validates_presence_of :reference
  validates_presence_of :amount
  validates_presence_of :customer_name
  validates_presence_of :narration
  validates_presence_of :brand_manager

  def self.pending_collections
    left_outer_joins(:collections).having("invoices.amount + ifnull(sum(collections.amount), 0) > 0")
    .group("invoices.reference")
  end

  def self.completed_collections
    joins(:collections).having("invoices.amount + (sum(collections.amount)) = 0")
    .group("invoices.reference")
  end

  def amount_due
    amount + collections.sum(:amount)
  end

  def add_invoice_date
    self.invoice_date = Date.today.strftime("%Y-%m-%d")
  end
end