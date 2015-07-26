Template.fieldTextAutocomplete.rendered = ->
  #d("TextAutocomplete:", this.data);
  self = this
  collection = @data.collection or DictationDefaults
  $('#' + @data.field).autocomplete(
    source: (query, process) ->
      suggestions = collection.findOne('field': self.data.field)
      process suggestions and suggestions.list
      return
    minLength: 0
    change: (event, ui) ->
      #d("onChange "+self.data.field);
      if self.data.definition.onChange
        self.data.definition.onChange self.data.field, @value
      return
  ).focus ->
    $(this).data('autocomplete').search $(this).val()
