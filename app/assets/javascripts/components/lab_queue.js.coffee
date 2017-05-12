@Lab = React.createClass
  handleRegistrate: (e) ->
    e.preventDefault()
    $.ajax
      method: 'GET'
      url: "/lab_queues/#{ @props.lab_queue.id}/registrate_on_lab"
      success: () =>

  render: ->
    React.DOM.div
      className: 'card-block'
      React.DOM.div
        className: 'col-sm-3'
        React.DOM.div
          className: 'card'
          React.DOM.div
            className: 'card-block'
            React.DOM.div
              className: 'card-title'
              '1'
              React.DOM.div
                className: 'card-text'
                "#{@props.lab_queue.date}"
              React.DOM.button
                onClick: @handleRegistrate
                'Registrate'