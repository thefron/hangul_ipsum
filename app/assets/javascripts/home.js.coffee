#= require modernizr
#= require jquery
#= require jquery_ujs

$(document).ready ->
  $('#generate_ipsum').live('ajax:success', (e, xhr) ->
    $('#ipsum_result').html xhr.ipsum
  ).submit()
