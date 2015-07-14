Template.fieldTextareauml.rendered = function() {
}

debouncedPlantUml = _.debounce(plantUml,500);

Template.fieldTextareauml.events({
	"keyup .textareauml": function(event, template) {
		var text = $(event.currentTarget).val();
		//da(['cards'], "Check for plantuml:", text);
		var parsedArray = text.match(/\@startuml([^]+)\@enduml/m);
		//da(['field-uml'], "Parsed array:", parsedArray);
		var el = $(template.find('#'+this.field+"Img"));
		if(parsedArray) {
			var umlText = parsedArray[1];
			debouncedPlantUml(umlText, function(e) {
			//plantUml(umlText, function(e) {
				//da(['field-uml'], "Got plantuml response:", e);
				el.attr("src", e);
			});
			el.show();
		} else {
			el.hide();
		}
	}
});
