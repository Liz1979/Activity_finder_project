class ActivityFinderController < ApplicationController
  def index
    @location = Location.new
  end
end
