class FlagsController < ApplicationController
  def create
    Flag.create(user: current_user, purchase_id: params[:purchase_id])
  end
end
