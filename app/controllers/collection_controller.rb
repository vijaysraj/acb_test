class CollectionController < ApplicationController
	before_action :find_invoice, only: [:new, :create]

  def new
    @collection = Collection.new(invoice_id: @invoice.id, reference: @invoice.reference)
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.invoice_id = @invoice.id
    
    if @collection.save
      redirect_to invoices_path
    else
      render :new
    end
  end

  

  private

  def collection_params
    params.require(:collection).permit(:reference, :amount)
  end

  def find_invoice
    @invoice = Invoice.find_by(id: params[:invoice_id])
  end
end
