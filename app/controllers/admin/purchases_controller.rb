class Admin::PurchasesController < Admin::BaseController
  def index
    @purchases = Purchase.all
  end
end
