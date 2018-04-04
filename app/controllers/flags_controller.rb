class FlagsController < ApplicationController
  def create
    Flag.create(user: current_user, purchase_id: params[:purchase_id])
  end

  def destroy
    Flag.find_by_purchase_id(params[:purchase_id]).destroy
  end
end
