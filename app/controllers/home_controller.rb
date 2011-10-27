class HomeController < ApplicationController
  def index
  end

  def generate_ipsum
    predicates = Rails.cache.fetch('predicates') {
      TextSource.all.map{|ts| ts.predicates}.flatten
    }
    words = Rails.cache.fetch('words') {
      TextSource.all.map{|ts| ts.words}.flatten
    }

    paragraphs = unless params[:paragraphs].nil? then params[:paragraphs].to_i else 3 end
    length = case params[:length]
             when 'long'
               10
             when 'medium'
               6
             when 'short'
               3
             end

    p = []
    (1..paragraphs).each do |i|
      s = []
      (1..(length + rand(3))).each do |j|
        s.push ((words.sample(5 + rand(5)) + [predicates.sample]).join(' ')+'.')
      end
      p.push s.join(' ')
    end
    ipsum = p.join('<br><br>')

    data = {:ipsum => ipsum}

    respond_to do |format|
      format.html
      format.json {render :json => data}
    end
  end
end
