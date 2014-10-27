Router.configure({})

Router.map () ->
  @route 'Blank', path: '/'
  @route 'TestForm', path: '/view', controller: 'TestFormController'
  