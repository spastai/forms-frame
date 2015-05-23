Template.fieldCheckbox.rendered = function() {
	var data = this.data;
	//console.log("Setting set result function for checkbox");
	this.data.getResult = function() {
		//console.log({m:"Checkbox value getResult", o: $("#"+data.field).is(':checked')});
		return $("#"+data.field).is(':checked')
	}
}

Template.fieldCheckbox.helpers({
	marked: function() {
		//console.dir(["Checkbox context:"].push(this));
		return this.value ? "checked" : "";
	}
});

Template.fieldCheckbox.events({
	'change .check': function (event, template) {
		$(template.find(".check")).is(':checked');
		//console.dir({m:"Setting checkbox value ", o: this});
	}
});
