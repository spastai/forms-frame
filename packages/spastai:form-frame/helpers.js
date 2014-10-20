UI.registerHelper('getFieldTemplate', function() {
	var name = this.type;
	var template = 'field'+name.charAt(0).toUpperCase() + name.substring(1).toLowerCase();
//	console.log("Render:"+template);
//	console.dir(Template[template]);
	return Template[template] ? Template[template]: null;
});

createFormValues = function(form, values) {
	var result = []
	_(form).each(function(item){
		result.push(_.extend({
			value: values[item.field],
			// TODO check if this needed - might be the in each iteration copy is given, but the need is to edit form
			setResult: function(value) {
				this.result = value;
				//d("Setting field result:"+value, this);
			},
			result: values[item.field],
		    dep: new Deps.Dependency // for showing errors 
		}, item));
	});
	return result;
}

getFormValues = function(form, template) {
	var result = {};
	//d("Fetching values from DOM and form variable:", form)
	for(f in form) {
		var id = form[f].field;
		var element = template.find('#'+id);
		result[id] = _.isUndefined(form[f].result) ? $(element).val() : form[f].result;
	}
	//console.dir(result);
	return result;
}
