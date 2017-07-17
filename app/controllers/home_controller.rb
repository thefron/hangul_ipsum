class HomeController < ApplicationController
  def index
    @text_sources = TextSource.select(:id, :title).all
  end
end
