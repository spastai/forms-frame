Template.fieldAddress.rendered = ->
  self = @
  element = document.getElementById(@data.field)
  mapElement = document.getElementById(@data.field + '-map-'+@data.formName)
  self.data.result = self.data.value;
  #d "Setting values to edit ", self.data.result
  googleServices.afterInit ->
    center = self.data.result;
    if self.data.result
      loc = self.data.result.location
      center = new (google.maps.LatLng)(loc[1], loc[0])
    else if self.data.mapCenter
      loc = self.data.mapCenter()
      if loc then center = new (google.maps.LatLng)(loc[1], loc[0])
    else if Meteor.settings?.formsFrame?.fieldAddress?.mapCenter
      fromProperties = Meteor.settings.formsFrame.fieldAddress.mapCenter
      center = new (google.maps.LatLng)(fromProperties[1], fromProperties[0])
    myOptions =
      zoom: 9
      center: center or new (google.maps.LatLng)(38.0179356, -122.5365176)
      mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new (google.maps.Map)(mapElement, myOptions)
    googleServices.addAutocomplete element, map, (addressText, place, map) ->
      #d("Setting address:"+self.data.field+" "+addressText);
      self.data.result = address: addressText
      #d("Start geocode addess :"+addressText)
      googleServices.getGeocoder().geocode { 'address': addressText }, (error, result) ->
        #d 'Got geocode addess response:' + error, result
        if !error and result.length > 0
          location = result[0].geometry.location
          self.data.result.location = [location.lng(), location.lat()]
          if !self.fromMarker
            #pinImage = new (google.maps.MarkerImage)('http://chart.googleapis.com/chart?chst=d_simple_text_icon_left&chld=|14|000|home|24|000|FFF', new (google.maps.Size)(32, 32), new (google.maps.Point)(0, 0), new (google.maps.Point)(16, 32))
            #d("Drop pin on map:"+pinImage, location)
            self.fromMarker = new (google.maps.Marker)(
              map: map
              position: location
              #icon: pinImage
              draggable: true)
          self.fromMarker.setPosition location
          map.setCenter location
        else
          self.data.result.location = ''
        self.data.dep.changed()

Template.fieldAddress.helpers hasLocation: ->
  #d("Returning location:", this);
  @dep.depend()
  @result?.location

Template.valueAddress.rendered = ->
  self = this
  mapElement = document.getElementById(@data.field + '-map-value-'+@data.formName)
  googleServices.afterInit ->
    center = undefined
    if self.data.value?.location
      loc = self.data.value.location
      center = new (google.maps.LatLng)(loc[1], loc[0])
    else if self.data.mapCenter
      loc = self.data.mapCenter()
      if loc
        center = new (google.maps.LatLng)(loc[1], loc[0])
    else if Meteor.settings?.formsFrame?.fieldAddress?.mapCenter?
      fromProperties = Meteor.settings.formsFrame.fieldAddress.mapCenter
      center = new (google.maps.LatLng)(fromProperties[1], fromProperties[0])
    # Draw map
    myOptions =
      zoom: 9
      center: center or new (google.maps.LatLng)(38.0179356, -122.5365176)
      mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new (google.maps.Map)(mapElement, myOptions)
    # Drop marker
    if !self.fromMarker and self.data.value?.location
      #pinImage = new (google.maps.MarkerImage)('http://chart.googleapis.com/chart?chst=d_simple_text_icon_left&chld=|14|000|home|24|000|FFF', new (google.maps.Size)(32, 32), new (google.maps.Point)(0, 0), new (google.maps.Point)(16, 32))
      #d("Drop pin on map:"+pinImage, location)
      self.fromMarker = new (google.maps.Marker)(
        map: map
        position: center
        #icon: pinImage
        draggable: true)
      self.fromMarker.setPosition center

# ---
# generated by js2coffee 2.0.4
