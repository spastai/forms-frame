Template.fieldSelect.helpers({
	items: function(parent) {
		//console.dir(["Select @:", this]);
		var result = [];
		var options = this.options.bind(parent)();
		for(o in options){
			var selected = options[o].value == this.value ? "selected" : "";
			result.push({value:options[o].value, selected: selected, title:options[o].title});
		};
		return result;
	}
});

Template.fieldSelect.events({
	'change .select': function(event, template) {
		value = $(event.target).val();
		//d("Selected:"+value);
		template.data.setResult && template.data.setResult(value);
		template.data.result = value;
	}	
})
