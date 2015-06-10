unless typeof MochaWeb is "undefined"
  MochaWeb.testOnly ->
    describe "https://github.com/spastai/forms-frame/issues/3", ->
      it "SubformRows should not save fields id's", ->
        Router.go('TestForm');
        Tracker.flush();

        # subformRows
        $("#field").val("SubFormTestValue");

        $(".addRow").click();

        $("#save").click();

        Tracker.flush();

        # bus is related to rendering - for rendering _id are added, so they appear in "result" only after some time
        values = Session.get("values");
        #console.log({m:"Test SubformRows values:", v:JSON.stringify(values)});
        chai.assert.isUndefined(values.form[0]._id)

        # Forse form re-rendering and setResults setting
        Router.go('Blank');
        Tracker.flush();
