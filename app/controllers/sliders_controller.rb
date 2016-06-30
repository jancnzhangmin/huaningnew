class SlidersController < ApplicationController
  def index

  end

  def search
    @contents = Content.where(isnew:'0')
  end





end
