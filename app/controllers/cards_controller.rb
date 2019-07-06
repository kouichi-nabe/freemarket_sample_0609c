class CardsController < ApplicationController
  def index
  end

  def new
     render layout: 'application-off.haml'
  end
  def show
     render layout: 'application-off.haml'
  end
end
