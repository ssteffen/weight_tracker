WeightTracker.Mood = Ember.Resource.extend
  resourceUrl: '/moods'
  resourceName: 'mood'
  resourceProperties: ['mood', 'created_at']

  init: ->
    this.set('mood', 50)

  categorizeMood: (->
    cat_id = Math.round(this.get("mood") / 10)
    switch cat_id
      when 0 then "assets/rage/desk_flip.png"
      when 1 then "assets/rage/fuu.png"
      when 2 then "assets/rage/no.png"
      when 3 then "assets/rage/kidding_me.png"
      when 4 then "assets/rage/pokerface.png"
      when 5 then "assets/rage/not_bad.png"
      when 6 then "assets/rage/good.png"
      when 7 then "assets/rage/thumbs_up.png"
      when 8 then "assets/rage/happy.png"
      when 9 then "assets/rage/me_gusta.png"
      when 10 then "assets/rage/freddie.png"
  ).property('mood')
