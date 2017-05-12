@Labs = React.createClass
  handleRegistrate: (e) ->
    e.preventDefault()
    $.ajax
      method: 'GET'
      url: "/lab_queues/#{ @props.lab_queue.id}/registrate_on_lab"
    success: () =>

  getInitialState: ->
    lab_queues: @props.lab_queues
  getDefaultProps: ->
    lab_queues: []
  render: ->
    React.DOM.div
      id: 'demo'
      React.DOM.div
        className: 'table-responsive-vertical shadow-z-1'
        React.DOM.table
          className: 'table table-hover table-mc-light-blue'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Info'
          React.DOM.tbody null,
            for lab_queue in @state.lab_queues
              React.createElement Lab, key: lab_queue.id, lab_queue: lab_queue