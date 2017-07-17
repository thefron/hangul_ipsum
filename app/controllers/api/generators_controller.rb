# Api::GeneratorsController generates ipsum texts.
class Api::GeneratorsController < ApplicationController
  def create
    ipsum = Generator.new(
      text_source_ids: params[:text_source_ids],
      paragraphs: params[:paragraphs],
      length: paragraph_length
    ).generate

    render json: { ipsum: ipsum }
  end

  private

  def paragraph_length
    case params[:length]
    when 'long' then 10
    when 'medium' then 6
    when 'short' then 3
    else 6
    end
  end
end
