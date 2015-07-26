Package.describe({
	name: 'dry:file-upload',
  summary: "File upload",
	version: "0.0.1",
});

Package.onUse(function(api) {
	  api.versionsFrom('0.9.0');
	  api.use(["ejson", "underscore" ], ["client", "server"]);
	  api.add_files("fileUploadServer.js", 'server');
	  api.add_files(["fileUploadMethod.js"], 'client');
	  api.add_files(["meteor-file.js"], ["client", "server"]);

	  api.export(['MeteorFile'], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
});
