WeightTracker.NewWeightView = Ember.View.extend
  templateName: 'ember/templates/weights/edit'
  tagName: 'form'

  init: ->
    this._super()
    this.set("weight", WeightTracker.Weight.create())

  didInsertElement: ->
    this._super()
    this.$('input:first').focus()

  cancelForm: ->
    this.hide()

  submit: (event) ->
    self = this
    weight = this.get("weight")

    event.preventDefault()

    weight.saveResource()
      .fail (e) ->
        WeightTracker.displayError(e);
      .done ->
        WeightTracker.weightsController.pushObject(weight)
        WeightTracker.firstRun = false
        self.set('weight', WeightTracker.Weight.create())
        self.get("parentView").getLastUpdate()
        GraphCanvas.setupCanvas()
        self.hide()

  hide: ->
    $('.weight').slideUp('fast')
    this.get('parentView').hideNew()
