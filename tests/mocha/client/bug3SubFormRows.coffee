unless typeof MochaWeb is "undefined"
  MochaWeb.testOnly ->
    describe "https://github.com/spastai/forms-frame/issues/3", ->
      it "SubformRows should not save fields id's", ->
        Router.go('TestForm');
        Tracker.flush();

        # subformRows
        $("#field").val("SomeValue");

        $(".addRow").click();
        $("#save").click();

        #console.dir(["Checkbox found:", $("#check")]);
        values = Session.get("values");
        console.log(["Test SubformRows values:", values]);
        #chai.assert.equal(v)

        # Forse form re-rendering and setResults setting
        Router.go('Blank');
        Tracker.flush();
