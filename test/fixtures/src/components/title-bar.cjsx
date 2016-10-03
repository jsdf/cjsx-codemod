# @cjsx React.DOM

_ = require 'underscore'
React = require 'react/addons'

module.exports = React.createClass
  displayName: 'TitleBar'
  statics:
    layout:
      height: 44

  getInitialState: ->

  getDefaultProps: ->
    title: ''
    nextLabel: 'Next'
    prevLabel: 'Back'
    next: true
    prev: true
    onNext: -> console.log('next')
    onPrev: -> console.log('prev')

  nextOnSelect: ->
    @props.onNext()
    return false

  prevOnSelect: ->
    @props.onPrev()
    return false

  navButton: (handler, direction, label) ->
    <button
      className="btn btn-link btn-nav pull-#{direction}"
      onTouchStart={handler}
      onMouseDown={handler}
    >
      <span className="icon icon-#{direction}-nav"></span>
      {label}
    </button>

  render: ->
    prevButton = if @props.prev
      @navButton(@prevOnSelect, 'left', @props.prevLabel)
    else
      null

    nextButton = if @props.next
      @navButton(@nextOnSelect, 'right', @props.nextLabel)
    else
      null

    <header className="bar bar-nav">
      {prevButton}
      <h1 className="title">{@props.title}</h1>
      {nextButton}
    </header>

