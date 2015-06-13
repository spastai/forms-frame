
fieldPagePictureForm = [
    {field: "pageUrl", type: 'pagePicture', label: "Url", placeholder: "...", clazz: "form-control", group:"contact"},
]

class @TestFieldPagePictureController extends RouteController

  data: ()=>
    query = {};
    #d "Creating page picture form"
    formValues = createFormValues(fieldPagePictureForm, query);
    result =
      form: formValues

Template.PagePictureForm.rendered  = ()->
	#console.log("TestForm rendered");

Template.PagePictureForm.helpers
  values: ()->
    val = Session.get("values") || {};
    #d "Show page picture values", val
    createFormValues(fieldPagePictureForm, val, 'PagePictureForm');

Template.PagePictureForm.events
  'click .save':  (event, template)->
    values = getFormValues(template.data.form, template);
    d "Set page picture values", values
    Session.set("values", values);
