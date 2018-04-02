class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find(params[:id])
  end

  def index
  end
end
