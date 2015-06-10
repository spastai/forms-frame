
fieldAddressForm = [
    {field: "address", type: 'address', label: "Address", placeholder: "...", clazz: "form-control", group:"contact"},
]

class @TestFieldAddressController extends RouteController
  template: "AddressForm",

  data: ()=>
    query = {};
    formValues = createFormValues(fieldAddressForm, query);
    result =
      form: formValues

Template.AddressForm.rendered  = ()->
	#console.log("TestForm rendered");

Template.AddressForm.helpers
  values: ()->
    val = Session.get("values") || {};
    createFormValues(fieldAddressForm, val);

Template.AddressForm.events
  'click .save':  (event, template)->
    values = getFormValues(template.data.form, template);
    #console.log({m: "Saving TestForm", v: values});
    Session.set "values", values
