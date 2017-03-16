angular.module('bsuirSchedule', ['ui.router', 'templates'])
    .config([
        '$stateProvider',
        '$urlRouterProvider',
        function($stateProvider, $urlRouterProvider) {
            $stateProvider
                .state('home', {
                    url: '/home',
                    templateUrl: '_index.html',
                    controller: 'MainCtrl'
                });
            $urlRouterProvider.otherwise('home');
        }
    ])
    .factory('groups',[
        '$http', function($http){}
    ])
    .controller('MainCtrl', [
        '$scope',
        function($scope) {
            $scope.test = "Hello, World!";
        }
    ]);