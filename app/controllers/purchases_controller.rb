class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.create!(purchase_params)
    @purchase.program_vendor_purchases.first
    require 'pry'; binding.pry
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
                                     :amount,
                                     program_vendor_purchases_attributes: [:program, :vendor])
  end
end
