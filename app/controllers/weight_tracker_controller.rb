class WeightTrackerController < ApplicationController
  def index
    @weights = Weight.where("created_at > ?", (Time.now - 8.days))
    @moods = Mood.where('created_at > ?', (Time.now - 8.days))

    respond_to do |format|
      format.html
      format.json do
        #Generate values for graph
        current = Time.now
        labels = Array(0..8).reverse.map do |day|
          (current - day.days ).localtime.strftime('%b %e')
        end
        earliest_time = Time.now - 8.days
        weights = @weights.map do |weight|
          #Convert Times to integer based "plot" for x axis.
          #Possbility for 108 slots, based on which hours of the day. 
          #Rounds to nearest 2 hours
          time_slot = 108 - ((current - weight.created_at)/(60*60 * 2)).round
          [time_slot, weight.weight, "orange"]
        end
        moods = @moods.map do |mood|
          time_slot = 108 - ((current - mood.created_at)/(60*60 * 2)).round
          [time_slot, mood.mood, "purple"]
        end
        render json: {:weights => weights, :moods => moods, :time_labels => labels}
      end
    end
  end
end
