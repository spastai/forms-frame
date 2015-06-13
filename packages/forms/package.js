Package.describe({
  summary: 'Meteor form framework',
  name: 'dry:forms-frame',
  version: "0.0.18",
  git: "https://github.com/spastai/forms-frame"
});

Package.on_use(function (api) {
	api.versionsFrom('0.9.0');

  api.use(['underscore', 'handlebars', 'templating', 'coffeescript'], 'client');
  api.add_files([
       'fieldString.html', 'fieldString.js',
       'fieldPassword.html',
       'fieldTextarea.html',
       'fieldHidden.html',
       'fieldSelect.html', 'fieldSelect.js',
       'fieldRadio.html', 'fieldRadio.js',
       'fieldCheckbox.html', 'fieldCheckbox.js',
       'fieldTags.html', 'fieldTags.js',
       'fieldListEdit.html', 'fieldListEdit.js',
       'fieldSubformRows.html', 'fieldSubformRows.js',
       'helpers.coffee'],
       'client');

  if (api.export) api.export(['createFormValues', 'getFormValues'], 'client');
});
