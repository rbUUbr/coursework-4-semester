angular.module('bsuirSchedule', ['ui.router', 'templates'])
    .config([
        '$stateProvider',
        '$urlRouterProvider',
        function($stateProvider, $urlRouterProvider) {
            $stateProvider
                .state('home', {
                    url: '/home',
                    templateUrl: '_index.html',
                    controller: 'MainCtrl',
                    resolve: {
                        groupPromise: ['groups', function(groups){
                            return groups.getAll();
                        }]
                    }
                });
            $urlRouterProvider.otherwise('home');
        }
    ])
    .controller('MainCtrl', [
        '$scope','groups',
        function($scope, groups) {
        $scope.test = "Hi";
        $scope.groups = groups.groups;
        }
    ]);