# Pin npm packages by running ./bin/importmap

pin "application", preload: true
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
pin "events", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/events.js"
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
