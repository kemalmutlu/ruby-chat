class HomeController < ApplicationController
  def index
    @popular_results= Result.popular_results
  end
end