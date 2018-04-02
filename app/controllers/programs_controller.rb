class ProgramsController < ApplicationController
  def show
    @program = Program.find(params[:id])
  end

  def index
    @programs = Program.all
  end
end
