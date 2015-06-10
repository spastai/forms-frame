###
 Try with http://pigu.lt/autoprekes/padangos/padanga_bp_pneus_19565_r15_91_h?id=881234
###
Template.fieldPagepicture.helpers
  images: ()->
    d "Show images", @images
    @dep.depend();
    @images


Template.fieldPagepicture.events
  'change [id^="url"]': (event, template) ->
    url = $(event.currentTarget).val()
    d("Select by pattern: #{url}");

    Meteor.call 'getUrlImages', url, (error, result) =>
      if error
        d 'Get images error:' + error
      else
        d 'Got response', result
        template.data.images = result
        template.data.dep.changed();
