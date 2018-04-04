class DashboardController < ApplicationController
  def index
    @programs = Program.total_spent
    @vendors = Vendor.total_earned
  end
end
