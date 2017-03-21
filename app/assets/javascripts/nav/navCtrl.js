angular.module('bsuirSchedule')
    .controller('NavCtrl', [
        '$scope',
        'Auth',
        function($scope, Auth) {
            $scope.signedIn = function() {
                if ($scope.user)
                    return true;
                else
                    return Auth.isAuthenticated();
            };

            $scope.logout = Auth.logout;

            Auth.currentUser().then(function(user) {
                $scope.user = user;
            });

            $scope.$on('devise:new-session', function(e, user) {
                $scope.user = user;
            });

            $scope.$on('devise:new-registration', function(e, user) {
                $scope.user = user;
            });

            $scope.$on('devise:login', function(e, user) {
                $scope.user = user;
            });

            $scope.$on('devise:logout', function(e, user) {
                $scope.user = null;
            });
        }
    ]);