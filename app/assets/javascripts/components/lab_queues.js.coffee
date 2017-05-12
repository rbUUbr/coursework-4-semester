@Labs = React.createClass
  getInitialState: ->
    lab_queues: @props.lab_queues
  getDefaultProps: ->
    lab_queues: []
  render: ->
    React.DOM.div
      id: 'demo'
      React.DOM.table
        className: 'table-responsive-vertical shadow-z-1'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Title'
        React.DOM.tbody null,
          for lab_queue in @state.lab_queues
            React.createElement Lab, key: lab_queue.id, lab_queue: lab_queue