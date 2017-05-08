angular
  .module('bsuirSchedule')
  .config(function($stateProvider, $urlRouterProvider, $httpProvider, $locationProvider){
      var interceptor = ['$location', '$q', function ($location, $q) {

          function success(response) {
              return response;
          }

          function error(response) {

              if (response.status === 401) {
                  $location.path('/login');
                  return $q.reject(response);
              }
              else {
                  return $q.reject(response);
              }
          }

          return function (promise) {
              return promise.then(success, error);
          };
      }];

      $httpProvider.interceptors.push(interceptor);
    $stateProvider
      .state('home', {
        url: '/home',
        templateUrl: 'views/home.html',
        controller: 'HomeCtrl'
      })
      .state('login', {
        url: '/login',
        templateUrl: 'views/login.html',
        controller: 'AuthCtrl',
        onEnter: function(Auth, $state){
          Auth.currentUser().then(function(){
            $state.go('home')
          })
        }
      })
      .state('register', {
        url: '/register',
        templateUrl: 'views/register.html',
        controller: 'AuthCtrl',
        onEnter: function(Auth, $state){
          Auth.currentUser().then(function(){
            $state.go('home')
          })
        }
      });
    $urlRouterProvider.otherwise('/home');
      $locationProvider.html5Mode({
          enabled: true,
          requireBase: false
      });
  });
