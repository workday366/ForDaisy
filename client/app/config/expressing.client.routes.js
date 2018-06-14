angular.module('expressing').config(['$stateProvider', '$urlRouterProvider',
  function($stateProvider) {
    //Listings state providing
    $stateProvider
      .state('expressing', {
        url: '/expressing',
        abstract: true,
        template: '<ui-view/>'
      })
      .state('expressing.main', {
        url: '',
        templateUrl: 'app/views/main-expressing.client.view.html', 
        params: {
          successMessage: null
        }
      })
    }
  ]);
