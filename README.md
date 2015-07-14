forms-frame
===========

About
-----
HTML Forms generating framework for Meteor based on patterns to DRY your code.

Quick start
-----------
meteor add dry:forms

```javascript
demoForm = [
	{field: 'url', type: 'text', label: "Feed URL", placeholder: "Enter URL", clazz: "form-control"},
	{field: 'media', type: 'select', label: "Media", placeholder: "Select category", clazz: "form-control", options: categories},
	{field: "form", type: "subformRows", form: fieldForm},
	{field: 'check', type: 'checkbox', label: "Agreement", placeholder: "Enter URL", clazz: "form-control"},
	{field: 'uml', type: 'textareauml', label: "Uml", placeholder: "Write PlantUML", clazz: "form-control"},
]
```
pass this variable to your template:

```handlebars
<div class="row">
  <div class="col-xs-10 col-xs-offset-1">
    {{#each demoForm}}
    <div class="form-group">
      <label for="{{field}}">{{label}}</label>
      {{> getFieldTemplate .}}
    </div>
    {{/each}}
  </div>
</div>
```
and you will get whole form generated

For more so called fields - check the packages.

Testing
-------------
1. UI tests
meteor add mike:mocha
run meteor and check mocha dot on  localhost:3000
2. Unit tests
meteor test-packages
3. To test cucumber (end user testing)
meteor add xolvio:cucumber
run
meteor
and
