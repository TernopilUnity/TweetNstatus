$(document).ready ->
  $('div#reload_form form').submit (event) ->
    event.preventDefault()
    url = this.action
    counts = $('#counts_to_reload')[0].value

  $.ajax
    type: 'put'
    url: url
    data: {counts_to_reload: counts}
    dataType: 'json'
    success: (json) ->
      $('#counts').text(json.counts)
      $('#reload_form').fadeOut() if json.counts >= 30
