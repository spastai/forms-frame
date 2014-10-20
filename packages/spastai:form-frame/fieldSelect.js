Template.fieldSelect.items = function(parent) {
	//d("Select:",this.definition.options());
	var result = [];
	var options = this.options.bind(parent)();
	for(o in options){
		var selected = options[o].value == this.value ? "selected" : "";
		result.push({value:options[o].value, selected: selected, title:options[o].title});
	};
	return result;
};
