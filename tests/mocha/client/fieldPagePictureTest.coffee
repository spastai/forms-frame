unless typeof MochaWeb is "undefined"
  MochaWeb.testOnly ->
    describe "Form with pagePicture field", ->
      it "Open New, set url, Create should save URL and pictures", ->
        Router.go('PagePictureForm');
        Tracker.flush();

        $("#url-pageUrl").val('http://www.aruodas.lt/butai-vilniuje-naujamiestyje-savanoriu-pr-pirmieji-rezervuokite-iii-ojo-etapo-butus-1-1821610/?paieska=0d10240bb963cd8896421495d2da1358&Page=1');
        $("#url-pageUrl").val('http://pigu.lt/autoprekes/padangos/padanga_bp_pneus_19565_r15_91_h?id=881234');
