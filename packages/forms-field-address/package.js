Package.describe({
  name: 'dry:forms-field-address',
  version: '0.0.9',
  // Brief, one-line summary of the package.
  summary: 'Form frame field for addresses - provides map and text input',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('0.9.0');
  api.use(['underscore', 'handlebars', 'templating', 'coffeescript'], 'client');
  api.use(['spastai:google-client@0.0.6'], 'client');

  api.addFiles([
    //'fieldAddress.html'
    'fieldAddress.html', 'fieldAddress.coffee'
  ], 'client');
});

/*
Package.onTest(function(api) {
  api.use('tinytest');
  api.use('spastai:forms-field-address');
  api.addFiles('forms-field-address-tests.js');
});
*/
