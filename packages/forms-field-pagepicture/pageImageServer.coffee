http = Npm.require("http");
request = Npm.require("request");
Future = Npm.require("fibers/future");
gm = Npm.require("gm");
async = Npm.require("async");
URL = Npm.require("url");

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

  try
    d 'Checking images: ', options
    HTTP.get options, (err, res) ->
      callback res.headers['content-length']
  catch err
    console.error(err);
    callback 0;

process.on 'uncaughtException',(err)->
    console.error(err.stack);
    #console.log({m:"uncaughtException", e:err});

Meteor.methods
  getUrlImages: (url) ->
    options = if process.env.HTTP_PROXY
      host: 'janus.omnitel.lan'
      port: 8080
      path: url
    else url
    host = URL.parse(url).protocol + "//"+URL.parse(url).host;
    d "Get url images #{options} from host: #{host}"

    fut = new Future
    ###
    http.get(options, (res) ->
      data = ''
      res.on 'data', (chunk) ->
        #console.log('BODY: ' + chunk);
        data += chunk
      res.on 'end', ->
        console.log('END.');
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
      ).on 'error', (e)->
        console.log('ERROR')
        console.erorr(e);
    fut.wait()
    ###

    try
      result = HTTP.get options
      #d "BODY:", result
      #pattern = /<.+?(src|href)=[\"'](.+?jpg)[\"'].+?>/g
      pattern = /<[^>]* (content|src|href)="([^"]*.jpg)"/g
      imgs = undefined
      links = []
      while (imgs = pattern.exec(result.content)) != null
        links.push imgs[2]
      # check http://stackoverflow.com/questions/4631774/coordinating-parallel-execution-in-node-js
      result = []
      #d 'Checking images links: ', links
      async.forEach links, ((link, callback) ->
        #d "Convert local link to site"
        if not link.match(/(http|ftp|https):\/\/[\w-]+(\.[\w-]+)/gi)
          link = host+if('/' == link[0]) then link else '/'+link;
        getImageSize link, (size) ->
          v 'Size:' + size + ':' + link
          if size > 10000
            result.push
              src: link
              size: size
          callback()
      ), ->
        #d 'Images analysis done:', result
        fut['return'] _.uniq(result, false, (value) ->
          value.src
        )
      fut.wait()
    catch error
      console.error(error);
      throw new Meteor.Error("Getting picture error", error);
