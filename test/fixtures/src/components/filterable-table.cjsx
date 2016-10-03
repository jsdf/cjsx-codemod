# @cjsx React.DOM

_ = require 'underscore'
React = require 'react/addons'
Table = require './table'
FilterInput = require './filter-input'

module.exports = React.createClass
  displayName: 'FilterableTable'

  getInitialState: ->
    filterValue: ''

  getDefaultProps: ->
    messageNoItems: 'No matching items were found'
    filterBy: 'name'
    filter: (items, filterValue, filterBy) ->
      _.filter items, (item) ->
        item[filterBy].indexOf(filterValue) > -1

  handleFilterChange: (newValue) ->
    @setState filterValue: newValue.toLowerCase()

  getTableContent: ->
    filteredItems = @props.filter(@props.items, @state.filterValue, @props.filterBy)

    if items.length
      @transferPropsTo <Table items={filteredItems} />
    else
      <div className="spark-content">
        {@props.messageNoItems or @defaultMessageNoItems}
      </div>
    
  render: ->
    <div className="spark-filterable-table">
      <FilterInput value={@state.filterValue} onChange={@handleFilterChange} />
      {@getTableContent()}
    </div>