Package.describe({
  summary: 'Meteor form framework',
  version: "0.0.9"
});

Package.on_use(function (api) {
	api.versionsFrom('0.9.0');

    api.use(['underscore', 'handlebars', 'templating'], 'client');
    api.add_files([
         'fieldString.html', 'fieldString.js',
         'fieldHidden.html',
         'fieldSelect.html', 'fieldSelect.js',
         'fieldCheckbox.html', 'fieldCheckbox.js',
         'fieldTags.html', 'fieldTags.js',
         'fieldListEdit.html', 'fieldListEdit.js',
         'fieldSubformRows.html', 'fieldSubformRows.js',
         'helpers.js'],
          'client');
    
    if (api.export) api.export(['createFormValues', 'getFormValues'], 'client');    
  });
