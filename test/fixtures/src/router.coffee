
Backbone = require('backbone')

module.exports = class SparkRouter extends Backbone.Router
  # default transition is 'prev' to handle back button case
  defaultTransition: 'prev'

  initialize: (@opts) ->

    # The transition is stored on the router as in the back button case
    # there is no opportunity to work out the correct transition to use before a
    # route is executed
    @transition = @opts.transition or false # disable initial transition on app start

    super

  appendView: (view) -> @appView.appendView(view, @transition)

  go: (path, transition, replace = false) ->
    console.warn('Router re-navigating to current route') if path is this.getCurrentRoute()

    # guard against navigation while in transitional state
    # kind of a hack to avoid AppView edge case bugs when user spams input
    if @appView.currentView? and @appView.currentView.ready? and not @appView.currentView.ready
      return # cancel this navigation
    
    if transition
      if typeof transition is 'string'
        @transition = transition
      else
        @transition = 'next'
    else
      @transition = false

    this.navigate(path, trigger: true, replace: replace)

    # reset @transition to handle back button case
    @transition = @defaultTransition if @transition

  back: ->
    window.history.back()

  getCurrentRoute: ->
    if (window.location.hash != "")
      window.location.hash.substring(1)
    else
      window.location.pathname.substring(1)
