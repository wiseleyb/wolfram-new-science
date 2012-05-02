class HomeController < ApplicationController
  
  respond_to :html, :pde
  
  def show
    @data = {:h => 300}
  end
  
end
