#= require modernizr
#= require jquery
#= require jquery-ujs

selectText = (element) ->
  doc = document
  text = $(element)[0]

  if doc.body.createTextRange
    range = doc.body.createTextRange()
    range.moveToElementText(text)
    range.select()
  else if window.getSelection
    selection = window.getSelection()
    range = doc.createRange()
    range.selectNodeContents(text)
    selection.removeAllRanges()
    selection.addRange(range)

$(document).ready ->
  $('#generate_ipsum').on('ajax:success', (e, xhr) ->
    $('.ipsum_result_container').fadeIn()
    $('#ipsum_result').html xhr.ipsum
    _gaq.push(['_trackEvent', 'Ipsum', 'Generate'])
  )
  $('#ipsum_result').click ->
    selectText(@)

  @
