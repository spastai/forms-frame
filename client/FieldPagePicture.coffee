
fieldPagePictureForm = [
    {field: "pageUrl", type: 'pagePicture', label: "Url", placeholder: "...", clazz: "form-control", group:"contact"},
]

class @TestFieldPagePictureController extends RouteController

  data: ()=>
    query = {};
    d "Creating page picture form"
    formValues = createFormValues(fieldPagePictureForm, query);
    result =
      form: formValues

Template.PagePictureForm.rendered  = ()->
	#console.log("TestForm rendered");

Template.PagePictureForm.helpers
  values: ()->
    val = Session.get("values") || {};
    createFormValues(fieldPagePictureForm, val);

Template.PagePictureForm.events
  'click .save':  (event, template)->
    values = getFormValues(template.data.form, template);
    #console.log({m: "Saving TestForm", v: values});
    Session.set "values", values
