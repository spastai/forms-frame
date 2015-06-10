Router.configure({})

Router.map () ->
  @route 'Blank', path: '/'
  @route 'TestForm', path: '/view', controller: 'TestFormController'
  @route 'TestFieldAddress', path: '/fieldAddress', controller: 'TestFieldAddressController'
  @route 'PagePictureForm', path: '/fieldPagePicture', controller: 'TestFieldPagePictureController'
