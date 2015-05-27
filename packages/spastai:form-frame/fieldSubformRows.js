Template.fieldSubformrows.created = function() {
	self = this;
	this.data.dep = new Deps.Dependency;
	this.data.setResult && this.data.setResult(this.data.value);
	this.data.getResult = function() {
		return self.data.result;
	}
}

// Adding Id's to the rows
Template.fieldSubformrows.helpers({
	markedResult: function() {
		this.dep.depend();
		_(this.result).each(function(item){
			item._id = new Mongo.ObjectID();
		});
		return this.result;

		/*
		_(this.result).map(function(item){
			// create copy array of items to keep result var unaffected
			_({_id:new Mongo.ObjectID()}).extend(item);
		});
		*/
	},

	cell: function() {
		return _.chain(this)
			.omit("_id")
			.values()
			.value();
	}
});

Template.fieldSubformrows.events({
	'click .addRow': function (event, template) {
		var values = getFormValues(this.form, template);
		//console.log({m:"Adding Subform values: "+JSON.stringify(values), v:values, f:this.form});
		if(!this.result) this.result = [];
		this.result.push(values)
		this.setResult && this.setResult(this.result);
		template.data.dep.changed();
		//console.dir(this);
	},
	'click .removeRow': function (event, template) {
		d("Search for "+this._id, this.result);
		var found =  _.findWhere(template.data.result, {_id: this._id})
		var result = _.without(template.data.result, found);
		template.data.setResult(result);
		template.data.dep.changed();
	}
});
