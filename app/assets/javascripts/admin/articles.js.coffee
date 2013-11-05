# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  $('.category_select').live('change',->
    if $(this).val() != ""
      window.location.href = "articles?id_cate=" + $(this).val()
    else
      window.location.href = "articles"
  )

#  Editor


