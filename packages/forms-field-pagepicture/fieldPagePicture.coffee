###
 Try with http://pigu.lt/autoprekes/padangos/padanga_bp_pneus_19565_r15_91_h?id=881234
###
Template.fieldPagepicture.rendered = ()->
  #d "Rendered fieldPagepicture", @data
  @data.result = @data.value;

Template.fieldPagepicture.helpers
  images: ()->
    #d "Show images for "+$('[id^="url"]').val(), @images
    @dep.depend();
    @result?.images
  selected: (parent)->
    #d "Is selected: #{@src == parent.result?.selectedPicture}"
    parent.dep.depend();
    @src == parent.result?.selectedPicture

Template.fieldPagepicture.events
  'change [id^="url"]': (event, template) ->
    url = $(event.currentTarget).val()
    d("Entered url: #{url}");
    fetchPictures(url ,template);

  'paste [id^="url"]': (event, template) ->
    $(event.currentTarget).keyup (e)->
      url = $(e.target).val();
      d "Pasted url:"+url
      $(e.target).unbind('keyup');
      fetchPictures(url, template);

  'click .selectPicture': (event, template) ->
    template.data.dep.changed();
    template.data.result.selectedPicture = @src

fetchPictures = (url, template)->
  template.data.result = url: url
  Meteor.call 'getUrlImages', url, (error, result) =>
    if error
      d 'Get images error:' + error
    else
      d 'Got response', result
      template.data.result.images = result
      template.data.dep.changed();
