NonEmptyString = (field, value)->
  d "Is NonEmptyString #{value}"
  if value?.length is 0 then return "#{field.label} should not be empty"

CheckRegexp = (field, value)->
  d "Check regexp  #{value}"
  if value.match field.validationRegexp
    return "#{field.label} "+field.validationText

validateFormValues = (form, values, onError, onSuccess = ()->)->
  hasErrors = false;
  _(form).each (item)->
    value = values[item.field]
    error = item.validator item, value
    #d "Validate #{item.field} - #{error}"
    if error
      hasErrors = true;
      onError(item.field, value, error)
    else
      onSuccess(item.field, value)
  hasErrors
