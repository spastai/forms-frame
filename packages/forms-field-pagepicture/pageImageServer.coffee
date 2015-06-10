http = Npm.require("http");
Future = Npm.require("fibers/future");
gm = Npm.require("gm");
async = Npm.require("async");

getImageDimensions = (url, callback) ->
  d 'Check dimensions:' + url
  gm(url).size (err, size) ->
    d 'Got dimensions:' + err
    callback size unless err

getImageSize = (url, callback)->
  options = if process.env.HTTP_PROXY
    host: 'janus.omnitel.lan'
    port: 8080
    path: url
  else url
  http.get options, (res) ->
    callback res.headers['content-length']

Meteor.methods
  getUrlImages: (url) ->
    d "Get url images"
    options = if process.env.HTTP_PROXY
      host: 'janus.omnitel.lan'
      port: 8080
      path: url
    else url
    fut = new Future
    ###
    #d 'Future created for nodejs http as it works with proxy : ', options
    #http.get options, (res) ->
      data = ''
      res.on 'data', (chunk) ->
        console.log('BODY: ' + chunk);
        data += chunk
      res.on 'end', ->
        pattern = /<.+?[src|href]=[\"'](.+?jpg)[\"'].+?>/g
        imgs = undefined
        links = []
        while (imgs = pattern.exec(data)) != null
          #	v("Size:"+getImageSize(myArray[1]));
          links.push imgs[1]
        # check http://stackoverflow.com/questions/4631774/coordinating-parallel-execution-in-node-js
        result = []
        d 'Checking images links: ', links
        async.forEach links, ((link, callback) ->
          getImageSize link, (size) ->
            v 'Size:' + size + ':' + link
            if size > 10000
              result.push
                src: link
                size: size
            callback()
        ), ->
          d 'Images analysis done:', result
          fut['return'] _.uniq(result, false, (value) ->
            value.src
          )
    fut.wait()
    ###
    result = HTTP.get options
    #d "BODY:", result
    pattern = /<.+?[src|href]=[\"'](.+?jpg)[\"'].+?>/g
    imgs = undefined
    links = []
    while (imgs = pattern.exec(result.content)) != null
      #	v("Size:"+getImageSize(myArray[1]));
      links.push imgs[1]
    # check http://stackoverflow.com/questions/4631774/coordinating-parallel-execution-in-node-js
    result = []
    d 'Checking images links: ', links
    async.forEach links, ((link, callback) ->
      getImageSize link, (size) ->
        v 'Size:' + size + ':' + link
        if size > 10000
          result.push
            src: link
            size: size
        callback()
    ), ->
      d 'Images analysis done:', result
      fut['return'] _.uniq(result, false, (value) ->
        value.src
      )
    fut.wait()
