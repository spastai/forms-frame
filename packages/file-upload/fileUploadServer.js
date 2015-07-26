/**
* TODO support other encodings:
* http://stackoverflow.com/questions/7329128/how-to-write-binary-data-to-a-file-using-node-js
*/
//var Future = require('fibers/future');
//fs = __meteor_bootstrap__.require('fs'),

var fs = Npm.require("fs");
var Future = Npm.require('fibers/future');

Meteor.methods({
		
	saveFile: function(blob, name, extension) {
      	encoding = encoding || 'binary';
      	var path = (Meteor.settings.uploadFilesDir || 'public')+"/";
      	name = Meteor.uuid(); 
    	//d("Uploading file to:"+path, Meteor.settings);
	    var fd =  fs.openSync(path+name+extension, 'w');
	    var buff = new Buffer(blob, encoding);
	    var written = Meteor.wrapAsync(fs.write)(fd, buff, 0, buff.length, 0);
        fs.close(fd);
        return {
        	name: name+extension,
        	url: Meteor.settings.uploadFilesUrl+"/"+name+extension
        }
  	}
});