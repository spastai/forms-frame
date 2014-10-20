// This is second way to pass result: use the setResult function
// copy initial result from value - this might be specific logic to init
Template.fieldCheckbox.created = function() {
	this.data.setResult(!!this.data.value);
}

Template.fieldCheckbox.marked = function() {
	//d("Checkbox context:",this);
	return this.value ? "checked" : "";
}

Template.fieldCheckbox.events({
	'change .check': function (event, template) {
		template.data.setResult($(template.find(".check")).is(':checked'));
		//d("Setting checkbox value ", this);
	}
});