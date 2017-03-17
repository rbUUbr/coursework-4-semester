angular.module('bsuirSchedule', ['ui.router', 'templates', 'Devise'])
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
                })
                .state('login', {
                    url: '/login',
                    templateUrl: 'auth/_login.html',
                    controller: 'AuthCtrl'
                })
                .state('register', {
                    url: '/register',
                    templateUrl: 'auth/_register.html',
                    controller: 'AuthCtrl',
                    onEnter: ['$state', 'Auth', function($state, Auth) {
                        Auth.currentUser().then(function (){
                            $state.go('home');
                        })
                    }]
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