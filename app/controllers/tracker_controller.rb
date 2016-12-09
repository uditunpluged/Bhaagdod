class TrackerController < ApplicationController

  layout 'tracker'
  autocomplete :customer, :phone, :full => true, display: :funky_method,:extra_data =>[:name,:email]

  def index
    @customer=Customer.new
  end

  def show

  end


end
