/*******************************
 * ListEdit component keeps lsit in memory
 */

Template.fieldListedit.created = function() {
	//console.log("Creating deps");
	this.data.dep = new Deps.Dependency;
}
Template.fieldListedit.rendered = function() {
	$('#'+this.data.field).val(this.data.value);
}
Template.fieldListedit.items = function() {
	//console.dir(this);
	this.dep.depend();
	return this.value;
};
Template.fieldListedit.events({
	'click .addToList': function (event, template) {
		var item = $(template.find('#'+this.field+'-text')).val();
		//v("Save item:"+item);
		(template.data.value || (template.data.value = [])).push(item);
		//d("Save item:"+this.field, template.data.value);
		$('#'+this.field).val(template.data.value);
		$(template.find('#'+this.field+'-text')).val('')
		template.data.dep.changed();				
	},
	'click .listEditItem': function (event, template) {
		//d("Item clicked:"+this+" for:",template.data);
		$(template.find('#'+template.data.field)).val(this);
	},
	'click .deleteFromList': function (event, template) {
		var item = $(template.find('#'+this.field)).val();		
		var list = Session.get('#'+this.field+'-list');
		Session.set('#'+this.field+'-list', _.without(list, item));
	}
});


