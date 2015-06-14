Package.describe({
  name: 'dry:forms-field-pagepicture',
  version: '0.0.5',
  // Brief, one-line summary of the package.
  summary: 'Form frame field for url - allows to use picture from the page as thumbnail',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Npm.depends({
  gm: "1.9.0",
  async: "1.2.1",
  request: '2.57.0',
  url: '0.10.3'
});

Package.onUse(function(api) {
  api.versionsFrom('0.9.0');

  api.use('spastai:logw@0.0.3')
  api.use('dry:forms-frame@0.0.18');

  api.use(['underscore', 'coffeescript', 'http'], ['server', 'client']);
  api.use(['handlebars', 'templating'], 'client');

  api.addFiles('pageImageServer.coffee', 'server');
  api.addFiles([
    'fieldPagePicture.html', 'fieldPagePicture.coffee'
  ], 'client');
});

/*
Package.onTest(function(api) {
  api.use('tinytest');
  api.use('spastai:forms-field-address');
  api.addFiles('forms-field-address-tests.js');
});
*/
