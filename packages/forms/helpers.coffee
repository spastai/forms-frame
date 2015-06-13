UI.registerHelper "getFieldTemplate", ->
  name = @type
  template = "field" + name.charAt(0).toUpperCase() + name.substring(1).toLowerCase()
  # console.log("Render:"+template);
  # console.dir(Template[template]);
  (if Template[template] then Template[template] else null)

UI.registerHelper "getValueTemplate", ->
  if not @type then e("No field type attribute provided."); return

  name = @type
  template = "value" + name.charAt(0).toUpperCase() + name.substring(1).toLowerCase()
  if Template[template]
    #d "Found teplate for "+template+" "+@field
    Template[template]
  else
    #d "Use default teplate for "+template+" "+@field
    Template['valueText']

getUiid = ()->
  new Mongo.ObjectID().toHexString();

createFormValues = (form, values, formName = getUiid()) ->
  result = []
  _(form).each (item) ->
    result.push _.extend(
      value: values[item.field]
      dep: new Deps.Dependency # for showing errors
      parent: result
      formName: formName
    , item)
  result

getFormValues = (form, template) ->
  result = {}
  ###
  console.log s:"Fetching values from DOM and form variable:", v:_.map form, (item)->
    _.omit(item, 'dep')
  ###
  #console.log({m:"Get form values start "+ JSON.stringify(result)});
  for f of form
    id = form[f].field
    element = template.find("#" + id)
    if form[f].getResult
      result[id] = form[f].getResult()
    # This form is used in fieldAddress
    else if not _.isUndefined(form[f].result)
      result[id] = form[f].result
    else
      result[id] = $(element).val()
    #console.log({m:"Getting form field #{id}=#{result[id]} "+JSON.stringify(result)})
  #console.log({m:"Get form values result "+JSON.stringify(result), r:result});
  result
