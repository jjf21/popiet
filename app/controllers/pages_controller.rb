class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @places = Place.last(3)

  end
end
