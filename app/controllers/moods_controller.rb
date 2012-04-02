class MoodsController < ApplicationController
  def index
    @moods = Mood.all

    respond_to do |format|
      format.json {render json: @moods}
    end
  end

  def show
    @mood = Mood.find(params[:id])

    respond_to do |format|
      format.json {render json: @mood}
    end
  end

  def create
    @mood = Mood.new(params[:mood])

    respond_to do |format|
      if @mood.save
        format.json { render json: @mood, status: :created, location: @mood }
      else
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @mood = Mood.find(params[:id])

    respond_to do |format|
      if @mood.update_attributes(params[:contact])
        format.json { render json: nil, status: :ok }
      else
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moods/1.json
  def destroy
    @mood = Mood.find(params[:id])
    @mood.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end
