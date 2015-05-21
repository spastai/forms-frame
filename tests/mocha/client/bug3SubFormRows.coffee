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
        console.dir(["Test values:", values]);
        #chai.assert.equal(v)
