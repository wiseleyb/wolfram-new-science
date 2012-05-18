class HomeController < ApplicationController
  
  respond_to :html, :pde
  
  def show
    @data = [0,0,0,1,1,1,1,0]
    respond_to do |format|  
      format.html  
      format.js { 
        8.times do |i|
          @data[i] = params["rule#{i}"] if params["rule#{i}"]
        end
      }  
    end
  end
  
end
