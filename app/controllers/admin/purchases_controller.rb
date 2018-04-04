class Admin::PurchasesController < Admin::BaseController
  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
    @purchase.program_vendor_purchases.new
  end
end
