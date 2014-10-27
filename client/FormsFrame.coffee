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
]

Template.Blank.rendered  = ()->
  console.log("Blank rendered");
	
class @TestFormController extends RouteController
  template: "TestForm",

  data: ()=>
    query = {};
    formValues = createFormValues(demoForm, query);
    result = 
      form: formValues	

Template.TestForm.helpers 
  values: ()->
    val = Session.get("values") || {};
    _.map val, (item, key)->
      pair = 
        key: key
        value: item
  
Template.TestForm.events
  'click .save':  (event, template)->
    console.log("Saving values");
    values = getFormValues(template.data.form, template);
    #console.dir({m: "Form data", v: template.data.form});    
    Session.set "values", values
