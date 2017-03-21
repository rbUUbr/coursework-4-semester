angular.module('bsuirSchedule')
    .controller('AuthCtrl', [
        '$scope',
        '$rootScope',
        '$state',
        'Auth',
        '$auth',
        function($scope, $rootScope, $state, Auth, $auth) {
            $scope.authenticate = function(provider) {
                $auth.authenticate(provider).then(function(data) {
                    $rootScope.$broadcast('devise:new-session', data.data.user);
                    $state.go('home');
                });
            };

            $scope.login = function() {
                Auth.login($scope.user).then(function() {
                    $state.go('home');
                });
            };

            $scope.register = function() {
                Auth.register($scope.user).then(function() {
                    $state.go('home');
                });
            };
        }
    ]);