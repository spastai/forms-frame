forms-frame
===========

Testing
-------------
meteor test-packages


Create fields
-------------
Don't use created method to init data - as template will be reactivly rerendered, all this.data will be lost

The second way to pass result: use the setResult function
