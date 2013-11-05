jQuery ($) ->
  $('.language_filter_select').live 'change', ->
    set_title_text $(this).val()

set_title_text = (language_id, category_id) ->
  $('#language_select').load '/admin/categories/title_category_by_language/select', language_id: language_id, category_id: category_id