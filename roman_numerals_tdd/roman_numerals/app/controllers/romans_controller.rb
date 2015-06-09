class RomansController < ApplicationController

  def show
    
    @value = params[:num].to_i
    @result = @value.to_roman

  end

end
