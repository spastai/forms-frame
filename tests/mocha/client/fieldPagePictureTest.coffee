fieldPagePictureForm = [
    {field: "pageUrl", type: 'pagePicture', label: "Url", placeholder: "...", clazz: "form-control", group:"contact"},
]

unless typeof MochaWeb is "undefined"
  MochaWeb.testOnly ->
    describe "Form with pagePicture field", ->
      it "New PagePicture, set url, Create should save URL and pictures", ->
        Router.go('PagePictureForm');
        Tracker.flush();

        $("#url-pageUrl").val('http://www.aruodas.lt/butai-vilniuje-naujamiestyje-savanoriu-pr-pirmieji-rezervuokite-iii-ojo-etapo-butus-1-1821610/?paieska=0d10240bb963cd8896421495d2da1358&Page=1');
        $("#url-pageUrl").val('http://pigu.lt/autoprekes/padangos/padanga_bp_pneus_19565_r15_91_h?id=881234');

      it "Edit PagePicture value, keep unchanged, Update should leave same values", ->
        Router.go('Blank');
        #console.log("Go to blank and flush for TC3");
        query =
          pageUrl:
            url: "http://pigu.lt/autoprekes/padangos/padanga_bp_pneus_19565_r15_91_h?id=881234"
            selectedPicture: "abc"
        data =
          form: createFormValues(fieldPagePictureForm, query)
        #d "PagePicture mocha form ", data
        parentNode = document.getElementById("forTest");
        view = Blaze.renderWithData(Template.PagePictureForm, data, parentNode);
        Tracker.flush();

        ### TODO check why can't get any buttons
        button = $("#save");
        d "Pushing button to save values", button
        button.click();
        values = Session.get("urlValues") || {};
        d "PagePicture mocha values:", values
        chai.assert.deepEqual(values.pageUrl, query.pageUrl, "Page URL should match");
        Blaze.remove(view);
        ###
