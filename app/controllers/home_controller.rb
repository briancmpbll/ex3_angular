# Controller to serve the index layout.
class HomeController < ApplicationController
  def index
    render 'layouts/application'
  end
end
