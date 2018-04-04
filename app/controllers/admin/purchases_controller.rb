class Admin::PurchasesController < Admin::BaseController
  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
    @purchase.program_vendor_purchases.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to admin_purchases_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:transaction_date,
                                     :payment_date,
                                     :description,
                                     :amount)
  end
end
