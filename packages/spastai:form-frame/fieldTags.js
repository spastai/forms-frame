Template.fieldTags.created = function() {
	this.data.dep = new Deps.Dependency;
//	this.data.suggested = _.difference(this.data.tags(), this.data.value);
	//da(['feed'], "Suggested tag:"+this.data.value, this.data.tags());
}

Template.fieldTags.rendered = function() {
	$('#'+this.data.field).val(this.data.value);
}

Template.fieldTags.isSelected = function(parent) {
	//da(['feed'], "Is selected:"+this._id, parent.value);
	parent.dep.depend();
	return _.contains(parent.value, this._id);
}

Template.fieldTags.events({
	'keypress input.newTag': function (event, template) {
	    if (event.which === 13) {
	      var tag = template.find(".newTag").value;
	      template.data.createTag(tag)
	    }
	},
	'click .tag': function(event, tmpl) {
		var selected = $(event.currentTarget).attr("id");
		if(!tmpl.data.value) tmpl.data.value = [];
		da(['feed'], "Selected tag:"+selected, tmpl.data.value);
		
		if(	_.contains(tmpl.data.value,selected)) {
			tmpl.data.value = _.without(tmpl.data.value, selected);
		} else {
			tmpl.data.value.push(selected);
		}
		$('#'+tmpl.data.field).val(tmpl.data.value);
		tmpl.data.dep.changed();		
	},
});

