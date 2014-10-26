Template.fieldCheckbox.rendered = function() {
	var data = this.data;
	this.data.getResult = function() {
		return $("#"+data.field).is(':checked')
	}
}

Template.fieldCheckbox.marked = function() {
	//d("Checkbox context:",this);
	return this.value ? "checked" : "";
}

Template.fieldCheckbox.events({
	'change .check': function (event, template) {
		$(template.find(".check")).is(':checked');
		//d("Setting checkbox value ", this);
	}
});