describe("Tutorials template", function() {
    it("should show a list of tutorials when there are some available", function () {
        var div = document.createElement("DIV");
        var data = {tutorials: [{}, {}]};
        data.tutorials.count = function() { return 2; }
 
        var comp = Blaze.renderWithData(Template.tutorials, data);
 
        Blaze.insert(comp, div);
    
        expect($(div).find(".tutorialLine").length).toEqual(2);
    });
});
