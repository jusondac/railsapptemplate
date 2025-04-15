# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js" # @3.1.2
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "flowbite-datepicker" # @1.3.2
# I get this apexcharts on vendor/javascripts/apexcharts.js
pin "apexcharts", to: "apexcharts.js" # @3.38.0
# I put pin_all_from so I call it on application.js
pin_all_from "app/javascript/charts", under: "charts"
