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
