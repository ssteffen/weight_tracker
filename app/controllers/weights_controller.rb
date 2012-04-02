class WeightsController < ApplicationController
  def index
    @weights = Weight.all

    respond_to do |format|
      format.json {render json: @weights}
    end
  end

  def show
    @weight = Weight.find(params[:id])

    respond_to do |format|
      format.json {render json: @weight}
    end
  end

  def create
    @weight = Weight.new(params[:weight])

    respond_to do |format|
      if @weight.save
        format.json { render json: @weight, status: :created, location: @weight }
      else
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @weight = Weight.find(params[:id])

    respond_to do |format|
      if @weight.update_attributes(params[:contact])
        format.json { render json: nil, status: :ok }
      else
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1.json
  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end
