Template.fieldFile.events({
	'change .uploadFile': function(e, tmpl) {
		//d("Upload file to server");
		e.preventDefault();
		// Grab the file input control so we can get access to the
		// selected files
		var id = this.field;
		var fileInput = tmpl.find('input[type=file]');
		// We'll assign each file in the loop to this variable
		var file;
		for ( var i = 0; i < fileInput.files.length; i++) {
			file = fileInput.files[i];
			//d("Read the file into memory");
			MeteorFile.read(file, function(err, meteorFile) {
				da(['rest'],"PUT file:", meteorFile);
			});
		}
	},
});