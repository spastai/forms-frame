aspect.push "field-uml"

categories = ()->
	return [
	  {title: "Audio", value: "audio"},
	  {title: "Video", value: "video"}
	];

fieldTypes = ()->
  return [
    {title: "String", value: "text"},
    {title: "Checkbox", value: "checkbox"},
    {title: "Hidden", value: "hidden"}
  ]

fieldForm = [
  {field: "field", type: 'text', label: "Field"},
  {field: "label", type: 'text', label: "Label"},
  {field: "type", type: 'select', label: "Type", options: fieldTypes, clazz: "form-control"},
]

demoForm = [
	{field: 'url', type: 'text', label: "Feed URL", placeholder: "Enter URL", clazz: "form-control"},
	{field: 'media', type: 'select', label: "Media", placeholder: "Select category", clazz: "form-control", options: categories},
	{field: "form", type: "subformRows", form: fieldForm},
	{field: 'check', type: 'checkbox', label: "Agreement", placeholder: "Enter URL", clazz: "form-control"},
	{field: 'uml', type: 'textareauml', label: "Uml", placeholder: "Write PlantUML", clazz: "form-control"},
]

Template.Blank.rendered  = ()->
  #d "Blank rendered"

class @TestFormController extends RouteController
  template: "TestForm",

  data: ()=>
    query = {};
    formValues = createFormValues(demoForm, query, 'testForm', 'te-');
    result =
      form: formValues

Template.TestForm.rendered  = ()->
	#console.log("TestForm rendered");

Template.TestForm.helpers
  values: ()->
    val = Session.get("values") || {};
    _.map val, (item, key)->
      pair =
        key: key
        value: item

Template.TestForm.events
  'click .save':  (event, template)->
    values = getFormValues(template.data.form, template, 'te-');
    #d "Saving TestForm", values
    Session.set "values", values
