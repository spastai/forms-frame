Template.fieldTextAutocomplete.rendered = function() {
	//d("TextAutocomplete:", this.data);
	var self = this;
	var collection = this.data.collection || DictationDefaults;
	$('#'+this.data.field).autocomplete({
    	source: function(query, process) {
          	var suggestions = collection.findOne({'field':self.data.field});
          	process(suggestions && suggestions.list);
        },
        minLength: 0,
        change: function(event, ui) {
        	//d("onChange "+self.data.field);
        	if(self.data.definition.onChange) {
        		self.data.definition.onChange(self.data.field, this.value); 
        	}
        }
   	}).focus(function(){
		$(this).data("autocomplete").search($(this).val());
  	});
	
}
