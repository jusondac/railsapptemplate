# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
#  adding flowbite, just this
# add flowbite like this or you can use "importmap pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js""
pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js" # @3.1.2
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "flowbite-datepicker", to: "https://cdn.jsdelivr.net/npm/flowbite-datepicker@1.3.2/dist/flowbite-datepicker.min.js" # @1.3.2
# I get this apexcharts on vendor/javascripts/apexcharts.js
# adding apexcharts also, you can use "bin/importmap pin "apexcharts"
# after pinning, the apexcharts.js file will be in vendor/javascripts/apexcharts.js
# and tells importmap to use it by adding the line below
pin "apexcharts", to: "apexcharts.js" # @3.38.0
# I put pin_all_from so I call it on application.js
pin_all_from "app/javascript/charts", under: "charts"
