fieldAddressForm = [
    {field: "address", type: 'address', label: "Address", placeholder: "...", clazz: "form-control", group:"contact"},
    {field: "address2", type: 'address', label: "Address", placeholder: "...", clazz: "form-control", group:"contact"},
]

class @TestFieldAddressController extends RouteController
  template: "AddressForm",

  data: ()=>
    query = {
      address: location: [-122.5365176, 38.0179356]
      address2: location: [25.284004099999947, 54.6713496]
    };
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
