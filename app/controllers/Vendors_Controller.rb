class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find(params[:id])
  end

  def index
    @vendors = Vendor.all
  end
end
