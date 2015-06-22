fieldAddressForm = [
    {field: "address", type: 'address', label: "Address", placeholder: "...", clazz: "form-control", group:"contact"},
]

unless typeof MochaWeb is "undefined"
  MochaWeb.testOnly ->
    it "Edit address value, keep unchanged, Update should leave same values", ->
      Router.go('Blank');
      #console.log("Go to blank and flush for TC3");
      query =
        address: {"address":"Šiauliai County LT ","location":[23.138005099999987,55.9985751]};
      data =
        form: createFormValues(fieldAddressForm, query)
      #d "Address mocha form ", data
      parentNode = document.getElementById("forTest");
      view = Blaze.renderWithData(Template.AddressForm, data, parentNode);
      Tracker.flush();

      $("#save").click();
      values = Session.get("addressValues");
      #d "Address values from mocha test", values
      #chai.assert.equal(values.address, query.address.address, "Address string");
      chai.assert.deepEqual(values.address.location, query.address.location, "Location");
      Blaze.remove(view);
