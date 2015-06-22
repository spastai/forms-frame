Template.valueTextareauml.rendered = function() {
  var data = this.data;
  var text = data.value;
  var parsedArray = text.match(/\@startuml([^]+)\@enduml/m);
  //da(['DEBUG'], "Parsed array:", parsedArray);
  if(parsedArray) {
    var umlText = parsedArray[1];
    plantUml(umlText, function(e) {
      //da(['DEBUG'], "Uml src:", e);
      data.umlSrc = e;
      data.dep.changed();
    });
  }
}

Template.valueTextareauml.helpers({
  uml: function() {
    this.dep.depend();
    //da(['DEBUG'], "Getting dependet src:", this.umlSrc);
    return this.umlSrc;
  }
});
