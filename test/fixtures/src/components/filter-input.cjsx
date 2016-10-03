# @cjsx React.DOM

React = require 'react/addons'

module.exports = React.createClass
  displayName: 'FilterInput'

  getDefaultProps: ->
    onValueChange: (value) -> console.log(value)

  clearTextButton: ->
    {value, onValueChange} = @props

    clear = -> onValueChange('')

    if value isnt ''
      <span className="filter-input-clear" onClick={clear}>
        <i className="icon-remove-sign">x</i>
      </span>
    else
      null

  handleChange: (e) ->
    {onValueChange} = @props
    onValueChange(e.target.value)

  render: ->
    {handleChange} = @
    {value} = @props

    clearTextButton = @clearTextButton()

    @transferPropsTo(
      <div className="filter-input">
        <input
          type="text"
          placeholder="Search..."
          className="filter-input-text"
          onChange={handleChange}
          value={value}
        />
        {clearTextButton}
      </div>
    )