# Pin npm packages by running ./bin/importmap

pin "application", preload: true
# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.1.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "typed.js", to: "https://ga.jspm.io/npm:typed.js@2.0.12/lib/typed.js"
pin "star-rating.js", to: "https://ga.jspm.io/npm:star-rating.js@4.3.0/dist/star-rating.esm.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.2/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js"
pin "stimulus-autocomplete", to: "https://ga.jspm.io/npm:stimulus-autocomplete@3.0.2/src/autocomplete.js"
pin "youtube", to: "https://ga.jspm.io/npm:youtube@0.1.0/index.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/buffer.js"
pin "events", to: "https://ga.jspm.io/npm:events@3.3.0/events.js"
pin "fs", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/fs.js"
pin "http", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/http.js"
pin "https", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/https.js"
pin "mime", to: "https://ga.jspm.io/npm:mime@1.2.2/mime.js"
pin "path", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/path.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/process-production.js"
pin "qs", to: "https://ga.jspm.io/npm:qs@0.4.2/index.js"
pin "querystring", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/querystring.js"
pin "request", to: "https://ga.jspm.io/npm:request@2.1.1/main.js"
pin "sax", to: "https://ga.jspm.io/npm:sax@1.2.4/lib/sax.js"
pin "stream", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/stream.js"
pin "string_decoder", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/string_decoder.js"
pin "tls", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/tls.js"
pin "url", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/url.js"
pin "util", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/util.js"
pin "xml2js", to: "https://ga.jspm.io/npm:xml2js@0.1.9/lib/xml2js.js"
pin "youtube-player", to: "https://ga.jspm.io/npm:youtube-player@5.5.2/dist/index.js"
pin "debug", to: "https://ga.jspm.io/npm:debug@2.6.9/src/browser.js"
pin "load-script", to: "https://ga.jspm.io/npm:load-script@1.0.0/index.js"
pin "ms", to: "https://ga.jspm.io/npm:ms@2.0.0/index.js"
pin "sister", to: "https://ga.jspm.io/npm:sister@3.0.2/src/sister.js"
pin "mapbox", to: "https://ga.jspm.io/npm:mapbox@1.0.0-beta10/lib/mapbox.js"
pin "es6-promise", to: "https://ga.jspm.io/npm:es6-promise@4.2.8/dist/es6-promise.js"
pin "rest", to: "https://ga.jspm.io/npm:rest@2.0.0/browser.js"
pin "rest/interceptor", to: "https://ga.jspm.io/npm:rest@2.0.0/interceptor.js"
pin "rest/interceptor/defaultRequest", to: "https://ga.jspm.io/npm:rest@2.0.0/interceptor/defaultRequest.js"
pin "rest/interceptor/errorCode", to: "https://ga.jspm.io/npm:rest@2.0.0/interceptor/errorCode.js"
pin "rest/interceptor/mime", to: "https://ga.jspm.io/npm:rest@2.0.0/interceptor/mime.js"
pin "rest/interceptor/pathPrefix", to: "https://ga.jspm.io/npm:rest@2.0.0/interceptor/pathPrefix.js"
pin "rest/interceptor/template", to: "https://ga.jspm.io/npm:rest@2.0.0/interceptor/template.js"
pin "rest/parsers/rfc5988", to: "https://ga.jspm.io/npm:rest@2.0.0/parsers/rfc5988.js"
pin "rest/util/base64", to: "https://ga.jspm.io/npm:rest@2.0.0/util/base64.js"
pin "rest/util/uriTemplate", to: "https://ga.jspm.io/npm:rest@2.0.0/util/uriTemplate.js"
pin "@mapbox/mapbox-gl-geocoder", to: "https://ga.jspm.io/npm:@mapbox/mapbox-gl-geocoder@5.0.1/lib/index.js"
pin "#lib/client.js", to: "https://ga.jspm.io/npm:@mapbox/mapbox-sdk@0.13.7/lib/browser/browser-client.js"
pin "@mapbox/fusspot", to: "https://ga.jspm.io/npm:@mapbox/fusspot@0.4.0/lib/index.js"
pin "@mapbox/mapbox-sdk", to: "https://ga.jspm.io/npm:@mapbox/mapbox-sdk@0.13.7/index.js"
pin "@mapbox/mapbox-sdk/services/geocoding", to: "https://ga.jspm.io/npm:@mapbox/mapbox-sdk@0.13.7/services/geocoding.js"
pin "@mapbox/parse-mapbox-token", to: "https://ga.jspm.io/npm:@mapbox/parse-mapbox-token@0.2.0/index.js"
pin "base-64", to: "https://ga.jspm.io/npm:base-64@0.1.0/base64.js"
pin "eventemitter3", to: "https://ga.jspm.io/npm:eventemitter3@3.1.2/index.js"
pin "fuzzy", to: "https://ga.jspm.io/npm:fuzzy@0.1.3/lib/fuzzy.js"
pin "is-plain-obj", to: "https://ga.jspm.io/npm:is-plain-obj@1.1.0/index.js"
pin "lodash.debounce", to: "https://ga.jspm.io/npm:lodash.debounce@4.0.8/index.js"
pin "nanoid", to: "https://ga.jspm.io/npm:nanoid@3.3.4/index.browser.js"
pin "subtag", to: "https://ga.jspm.io/npm:subtag@0.5.0/subtag.js"
pin "suggestions", to: "https://ga.jspm.io/npm:suggestions@1.7.1/index.js"
pin "xtend", to: "https://ga.jspm.io/npm:xtend@4.0.2/immutable.js"
