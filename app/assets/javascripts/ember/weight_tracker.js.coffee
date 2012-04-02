#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates

window.WeightTracker = Ember.Application.create()

WeightTracker.firstRun = true

window.GraphCanvas =
  setupCanvas: ->
    #get json data from controllers and return only the concerning values
    #Couldn't get ember to return data from both views, used jquery call instead
    self = this
    $.ajax
      url: '/'
      method: 'get'
      dataType: 'json'
      success: (data) ->
        self.drawCanvas([data.weights, data.moods], data.time_labels)

  drawCanvas: (data, time_help) ->
    if(this.sg)
      RGraph.Clear($("#graphCanvas")[0], "transparent")
    this.sg = new RGraph.Scatter('graphCanvas', data)

    this.sg.Set('chart.background.barcolor1','royal')
    this.sg.Set('chart.background.barcolor2', 'royal')
    this.sg.Set('chart.grid.color', 'rgba(5, 5,5,1)')
    this.sg.Set('chart.gutter.left', 30)
    this.sg.Set('chart.labels', time_help)
    this.sg.Set('chart.line', true)
    this.sg.Set('chart.line.colors', ['orange', 'purple'])
    this.sg.Set('chart.line.linewidth', 5)
    this.sg.Set('chart.xmax', 108)

    this.sg.Draw()

  sg: {}

sg = false

$(document).ready ->
  do GraphCanvas.setupCanvas
