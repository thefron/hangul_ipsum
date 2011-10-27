class TextSourcesController < ApplicationController
  # GET /text_sources
  # GET /text_sources.json
  def index
    @text_sources = TextSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @text_sources }
    end
  end

  # GET /text_sources/1
  # GET /text_sources/1.json
  def show
    @text_source = TextSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text_source }
    end
  end

  # GET /text_sources/new
  # GET /text_sources/new.json
  def new
    @text_source = TextSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text_source }
    end
  end

  # GET /text_sources/1/edit
  def edit
    @text_source = TextSource.find(params[:id])
  end

  # POST /text_sources
  # POST /text_sources.json
  def create
    @text_source = TextSource.new(params[:text_source])

    respond_to do |format|
      if @text_source.save
        format.html { redirect_to @text_source, notice: 'Text source was successfully created.' }
        format.json { render json: @text_source, status: :created, location: @text_source }
      else
        format.html { render action: "new" }
        format.json { render json: @text_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_sources/1
  # PUT /text_sources/1.json
  def update
    @text_source = TextSource.find(params[:id])

    respond_to do |format|
      if @text_source.update_attributes(params[:text_source])
        format.html { redirect_to @text_source, notice: 'Text source was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @text_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_sources/1
  # DELETE /text_sources/1.json
  def destroy
    @text_source = TextSource.find(params[:id])
    @text_source.destroy

    respond_to do |format|
      format.html { redirect_to text_sources_url }
      format.json { head :ok }
    end
  end
end
