subForm = [
  {field: "label", type: 'text', label: "Label"},
]

testForm = [
  {field: 'check', type: 'checkbox', label: "Agreement", placeholder: "Enter URL", clazz: "form-control"},
  {field: "form", type: "subformRows", form: subForm},
]


unless typeof MochaWeb is "undefined"
  MochaWeb.testOnly ->
    describe "Form new, keep unchanged, create", ->
      it "should show default values", ->
        Router.go('TestForm');
        Tracker.flush();
        $("#save").click();
        values = Session.get("values");
        #console.log({m:"Test values:",v:values});
        chai.assert.isFalse(values.check, "Fresh checkbox should be false")
        # Forse form re-rendering and setResults setting
        Router.go('Blank');
        Tracker.flush();

    describe "Form new, set values, create", ->
      it "should show set values", ->
        Router.go('TestForm');
        Tracker.flush();
        # checkbox
        $("#check").prop('checked', true);
        # subformRows
        $("#field").val("qw");

        $("#save").click();
        #console.dir(["Checkbox found:", $("#check")]);
        values = Session.get("values");
        #console.log(["Test values:", values]);
        chai.assert.isTrue(values.check)
        #chai.assert.equal(v)

    describe "Form edit, keep unchanged, create", ->
      it "should show previous values", ->
        Router.go('Blank');
        #console.log("Go to blank and flush for TC3");
        query =
          check: true;
        data =
          form: createFormValues(testForm, query)
        parentNode = document.getElementById("forTest");

        #console.dir(["Creating view on body", parentNode]);
        view = Blaze.renderWithData(Template.TestForm, data, parentNode);
        Tracker.flush();
        #console.dir(["Checkbox in Blaze found:", $("#check")]);
        $("#save").click();
        values = Session.get("values");
        chai.assert.isTrue(values.check)
        Blaze.remove(view);

    describe "Form edit, change, create", ->
      it "should show new values", ->
        Router.go('Blank');
        #Log.info("Go to blank and flush for TC4");
        query =
          check: true;
        data =
          form: createFormValues(testForm, query)
        parentNode = document.getElementById("forTest");

        #console.dir(["Creating view on body", parentNode]);
        view = Blaze.renderWithData(Template.TestForm, data, parentNode);
        Tracker.flush();
        $("#check").prop('checked', false);

        #console.dir(["Checkbox in Blaze found:", $("#check")]);
        $("#save").click();
        values = Session.get("values");
        chai.assert.isFalse(values.check)
        Blaze.remove(view);
