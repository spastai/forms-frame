
Template.fieldRadio.items = function(parent) {
	//d("Select:",this.definition.options());
	var result = [];
	var options = this.options.bind(parent)();
	for(o in options){
		var selected = options[o].value == this.value ? "checked" : "";
		result.push({value:options[o].value, selected: selected, title:options[o].title});
	};
	return result;
};

Template.fieldRadio.events({
	'change .check': function (event, template) {
		var value = $(template.find("input:radio[name="+template.data.field+"]:checked")).val();
		template.data.setResult(value);
		//d("Setting radio value "+"input:radio[name="+template.data.field+"]:checked :", value);
	}
});