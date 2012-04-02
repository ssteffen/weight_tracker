WeightTracker.ListMoodsView = Ember.View.extend
  templateName: 'ember/templates/moods/list'
  moodsBinding: 'WeightTracker.moodsController'

  showNew: ->
    this.set('isNewVisible', true)
    $('.mood').slideDown('fast')

  hideNew: ->
    this.set('isNewVisible', false)

  currentDate: (->
    new Date().toDateString()
  ).property()

  lastUpdated: ->
    moods = this.get('moods').content
    if(moods.length > 0)
      lastMood = moods[moods.length - 1]
      date = new Date(lastMood.get('created_at'))
      current = new Date()
      time_difference_info = formatted_get_time_difference(date, current)
      if(WeightTracker.firstRun)
        this.showNew()
      $('.last_mood').html(time_difference_info.str)
      time_difference_info.str
    else
      this.showNew()
      "No Data"

  lastUpdate: (->
    this.lastUpdated()
  ).property('moods')
