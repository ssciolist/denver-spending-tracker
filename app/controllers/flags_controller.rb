class FlagsController < ApplicationController
  def create
    Flag.create(user: current_user, purchase_id: params[:purchase_id])
    redirect_back fallback_location: { action: "show" }
  end

  def destroy
    flag = Flag.find(params[:id])
    flag.destroy
    redirect_back fallback_location: { action: "show" }
  end
end
