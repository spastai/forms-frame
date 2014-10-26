if (Meteor.isClient) {
	fieldForm = [
	             {field: "field", type: 'text', label: "Field"},
	             {field: "label", type: 'text', label: "Label"},
	             {field: "type", type: 'select', label: "Type", options: fieldTypes},
    ]
	function categories() {
		return [
		  {title: "Audio", value: "audio"},
		  {title: "Video", value: "video"}
		];
	}
	function fieldTypes() {
	  return [
	    {title: "String", value: "text"},
	    {title: "Checkbox", value: "checkbox"},
	    {title: "Hidden", value: "hidden"}
	  ]
	}

	var demoForm = [
		{field: 'url', type: 'text', label: "Feed URL", placeholder: "Enter URL", clazz: "form-control"},
		{field: 'media', type: 'select', label: "Media", placeholder: "Select category", clazz: "form-control", options: categories},
		{field: "form", type: "subformRows", form: fieldForm},
		{field: 'check', type: 'checkbox', label: "Agreement", placeholder: "Enter URL", clazz: "form-control"},
	]
	
	// counter starts at 0
	Session.setDefault("counter", 0);
	
  Template.hello.helpers({
    counter: function () {
      return Session.get("counter");
    }, 
    demoForm: createFormValues(demoForm, {})
  });

  Template.hello.events({
    'click button': function (event, template) {
//      console.dir(template);
//      console.dir(this);
//      var values = getFormValues(template.data.demoForm, template);
      Session.set("counter", Session.get("counter") + 1);
    }
  });
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });
}
