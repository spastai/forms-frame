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
	#d "AddressForm rendered"

Template.AddressForm.helpers
  values: ()->
    val = Session.get("addressValues") || {};
    createFormValues(fieldAddressForm, val);

Template.AddressForm.events
  'click .save':  (event, template)->
    values = getFormValues(template.data.form, template);
    #d "Saving address values:", values
    Session.set "addressValues", values
