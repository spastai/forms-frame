forms-frame
===========

Testing
-------------
1. UI tests
meteor add mike:mocha
run meteor and check mocha dot
2. Execute
meteor test-packages
3. To test cucumber (user testing)
meteor add xolvio:cucumber

Create fields
-------------
Don't use created method to init data - as template will be reactivly rerendered, all this.data will be lost

The second way to pass result: use the setResult function
