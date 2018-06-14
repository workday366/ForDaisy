/* register the modules the application depends upon here*/
angular.module('expressing', []);

/* register the application and inject all the necessary dependencies */
var app = angular.module('Lover', ['ui.router', 'ui.bootstrap', 'uiGmapgoogle-maps', 'expressing']);

/* application configuration */
app.config(['$urlRouterProvider', '$locationProvider',
  function($urlRouterProvider, $locationProvider) {
    /* https://docs.angularjs.org/api/ng/provider/$locationProvider */
    $locationProvider.html5Mode(true);

    /* go to the '/expressing' URL if an invalid route is provided */
    $urlRouterProvider.otherwise('/expressing');
  }
]);

/* set the initial state of the application */
app.run(['$state',
  function($state) {
  }
]);
