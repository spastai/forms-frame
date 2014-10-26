Template.fieldText.rendered = function() {
	if(this.data.getResult) {
		this.data.getResult = this.data.getResult.bind(this.data);
	} 
}