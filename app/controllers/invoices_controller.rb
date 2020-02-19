class InvoicesController < ApplicationController

	def index
    @pending_collections = Invoice.pending_collections
    @completed_collections = Invoice.completed_collections
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path
    else
      render :new
    end
  end

  def show
    @invoice = Invoice.find_by(id: params[:id])
  end

  private

  def invoice_params
    params.require(:invoice).permit(:reference, :amount, :customer_name, :narration, :brand_manager)
  end

end
