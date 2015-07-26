Template.valueSelect.helpers
  title: () ->
    _(@options()).findWhere(value: @value)?.title
