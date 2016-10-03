# @cjsx React.DOM

React = require 'react/addons'

{classSet} = React.addons

module.exports = React.createClass
  displayName: 'TabBar'
  statics:
    layout:
      height: 50

  getInitialState: ->
    activeTab: null

  getDefaultProps: ->
    tabs: []

  handleTabSelect: (tab) ->
    tab.onSelect()
    return false

  render: ->
    self = this
    tabItems = @props.tabs.map (tab) ->
      tabClasses =
        'tab-item': true,
        'active': tab is @state.activeTab
      tabClasses["tab-#{tab.name}"] = true

      tabIcon = if tab.icon
          <div className="tab-icon"><i className="icon-#{tab.icon}"></i></div>
        else
          null

      handleSelect = ->
        self.handleTabSelect(tab)

      <li className={classSet(tabClasses)} onMouseDown={handleSelect} onTouchEnd={handleSelect}>
        {tabIcon if tabIcon}        
        <div className="tab-label">{tab.label}</div>
      </li>

    <nav className="bar-tab">
      <ul className="tab-inner">
        {tabItems}
      </ul>
    </nav>  
