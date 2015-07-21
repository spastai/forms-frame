Package.describe({
  summary: 'Meteor form framework validation',
  name: 'dry:forms-validation',
  version: "0.0.2",
  git: "https://github.com/spastai/forms-frame"
});

Package.on_use(function (api) {
	api.versionsFrom('0.9.0');

  api.use(['underscore', 'handlebars', 'templating', 'coffeescript'], 'client');
  api.add_files([
       'validator.coffee'],
       'client');

  if (api.export) api.export(['CheckRegexp', 'NonEmptyString', 'validateFormValues'], 'client');
});
