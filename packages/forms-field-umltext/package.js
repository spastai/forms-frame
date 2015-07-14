Package.describe({
  name: 'dry:forms-field-umltext',
  version: '0.0.2',
  // Brief, one-line summary of the package.
  summary: 'PlantUml based field',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('0.9.0');

  api.use('spastai:logw@0.0.3')
  api.use('dry:forms-frame@0.0.18');

  api.use(['underscore', 'coffeescript'], ['server', 'client']);
  api.use(['handlebars', 'templating'], 'client');

  api.addFiles('rawdeflate.js', 'client', {isAsset: true});
  api.addFiles([
    //'rawdeflate.js',
    'jquery_plantuml.js',
    'fieldTextareaUml.html', 'fieldTextareaUml.js',
    'valueTextareaUml.html', 'valueTextareaUml.js'
  ], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  //api.use('forms-field-umltext');
  //api.addFiles('forms-field-umltext-tests.js');
});
