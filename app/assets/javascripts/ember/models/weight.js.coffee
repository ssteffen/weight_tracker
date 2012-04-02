WeightTracker.Weight = Ember.Resource.extend
  resourceUrl: '/weights'
  resourceName: 'weight'
  resourceProperties: ['weight', 'created_at']

  init: ->
    this.weight = 100
