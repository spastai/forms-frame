UI.registerHelper "getFieldTemplate", ->
  name = @type
  template = "field" + name.charAt(0).toUpperCase() + name.substring(1).toLowerCase()
  # console.log("Render:"+template);
  # console.dir(Template[template]);
  (if Template[template] then Template[template] else null)

createFormValues = (form, values) ->
  result = []
  _(form).each (item) ->
    result.push _.extend(
      value: values[item.field]
      dep: new Deps.Dependency # for showing errors
      parent: result
    , item)
  result

getFormValues = (form, template) ->
  result = {}
  ###
  d "Fetching values from DOM and form variable:", _.map form, (item)-> 
    _.omit(item, 'dep')
  ###
  for f of form
    id = form[f].field
    element = template.find("#" + id)
    result[id] = if form[f].getResult
      form[f].getResult() 
    else 
      $(element).val()
 
  #console.dir(result);
  result
