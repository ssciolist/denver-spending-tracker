class FlagsController < ApplicationController
  def create
    Flag.create(user: current_user, purchase_id: params[:purchase_id])
    redirect_to user_path(current_user)
  end

  def destroy
    require 'pry'; binding.pry
    flag = Flag.find(params[:id])
    flag.destroy
    redirect_to user_path(current_user)
  end
end
