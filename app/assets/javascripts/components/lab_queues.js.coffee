@Labs = React.createClass
  getInitialState: ->
    lab_queues: @props.data
  getDefaultProps: ->
    lab_queues: []
  render: ->
    React.DOM.div
      className: 'labQueues'
      React.DOM.div
        className: 'container'
        React.DOM.div
          className: 'row'
          for lab_queue in @state.lab_queues
            React.createElement Lab, key: lab_queue.id, lab_queue: lab_queue