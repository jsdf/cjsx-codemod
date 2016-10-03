# @cjsx React.DOM

React = require 'react/addons'

module.exports = React.createClass
  displayName: 'Table'

  getDefaultProps: ->
    labelField: 'name'
    itemGetLabel: (item) -> item[@props.labelField]
    onSelection: (item) -> console.log item

  getInitialState: ->
    scrolling: false

  render: ->
    listItems = @props.items.map (item) =>
      handleTouchEnd = => @handleItemTouchEnd(item)

      <li 
        className="table-view-cell"
        onTouchStart={@handleTouchStart} onMouseDown={@handleTouchStart}
        onTouchEnd={handleTouchEnd} onMouseUp={handleTouchEnd}
      >
        {@props.itemGetLabel(item)}
      </li>

    <div onScroll={@handleViewScroll} className="spark-table">
      <ul className="table-view">
        {listItems}
      </ul>
    </div>

  handleTouchStart: (event) ->
    @setState(scrolling: false)

  handleViewScroll: (event) ->
    @setState(scrolling: true)

  handleItemTouchEnd: (item) ->
    @props.onSelection(item) unless @state.scrolling
    @setState(scrolling: false)
    return false