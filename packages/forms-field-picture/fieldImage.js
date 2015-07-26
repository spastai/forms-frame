/**
 * Relying that values are the copy.
 * TODO: result -> value as no need of additional property
 */
Template.fieldImage.created = function() {
	this.data.result = this.data.value ? this.data.value: [undefined];
	//d("0 position for selected picture:", this.data.result);
}

Template.fieldImage.images = function() {
	this.dep.depend();
	// TODO check why this is not initialized in created
	result = this.result ? this.result.slice(1) : [];
	//d("Images after slice:", result);
	return result;
}

Template.fieldImage.isSelected = function(parent) {
	parent.dep.depend();
	return parent.result[0] == this.valueOf();
}

Template.fieldImage.events({
	'change .uploadFile': function(event, template) {
		var self = this;
    	var ev = event.target || event.srcElement;
    	
       	//d("Save file:",ev.files);
        _.each(ev.files, function(file) {
          Meteor.saveFile(file, file.name, function(error, result) {
        	  self.result.push(result.url);
        	  if(undefined == self.result[0]) {
        		  self.result[0] = result.url;
        	  }
        	  //d("Images after saving:", self.result);
      		  self.dep.changed();
          });
        });
    },       
	'click .select': function(event, template) {
		//d("Selected picture:", this);
		template.data.result[0] = this.toString();
		template.data.dep.changed();
	},
});
