WeightTracker.ListWeightsView = Ember.View.extend
  templateName: 'ember/templates/weights/list'
  weightsBinding: 'WeightTracker.weightsController'

  showNew: ->
    this.set('isNewVisible', true)
    $('.weight').slideDown('fast')

  hideNew: ->
    this.set('isNewVisible', false)

  getLastUpdate: ->
    weights = this.get('weights').content
    if(weights.length > 0)
      lastWeight = weights[weights.length - 1]
      date = new Date(lastWeight.get('created_at'))
      current = new Date()
      time_difference_info = formatted_get_time_difference(date, current)
      if(time_difference_info.day > 0)
        this.showNew()
      $('.last_weight').html(time_difference_info.str)
      time_difference_info.str
    else
      this.showNew()
      "No Data"

  lastUpdate: (->
    this.getLastUpdate()
  ).property('weights')
