@LabQueues = React.CreateClass
  getInitialState: ->
    lab_queues: @props.data
  getDefaultProps: ->
    lab_queues: []
  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-sm-3'
          React.DOM.div
            className: 'card'
            React.DOM.div
              className: 'card-block'