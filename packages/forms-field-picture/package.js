Package.describe({
  name: 'dry:forms-field-picture',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: 'Forms frame field to upload picture',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('0.9.0');
  api.use('dry:file-upload@0.0.1');
  api.addFiles(['fieldImage.js', 'fieldImage.css', 'fieldImage.html'], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('dry:forms-field-picture');
  api.addFiles('forms-field-picture-tests.js');
});
