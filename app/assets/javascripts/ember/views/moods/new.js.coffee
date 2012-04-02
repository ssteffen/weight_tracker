WeightTracker.NewMoodView = Ember.View.extend
  templateName: 'ember/templates/moods/edit'
  tagName: 'form'

  init: ->
    this._super()
    this.set("mood", WeightTracker.Mood.create())

  didInsertElement: ->
    this._super()
    self = this
    $('#moodSlider').slider({
     max: 100
     min: 0
     value: 50
     slide: (event, ui) ->
       self.mood.set('mood', ui.value)
    })

  cancelForm: ->
    this.hide()

  submit: (event) ->
    self = this
    mood = this.get("mood")

    event.preventDefault()

    mood.saveResource()
      .fail (e) ->
        WeightTracker.displayError(e);
      .done ->
        WeightTracker.moodsController.pushObject(mood)
        WeightTracker.firstRun = false
        self.set("mood", WeightTracker.Mood.create())
        self.get('parentView').lastUpdated()
        GraphCanvas.setupCanvas()
        self.hide()

  hide: ->
    $('.mood').slideUp 'fast'
    this.get('parentView').hideNew()
