angular
  .module('bsuirSchedule')
  .controller('AuthCtrl', function($scope, $rootScope, Auth, $state){
      var config = {headers: {'X-HTTP-Method-Override': 'POST'}}

      $scope.register = function(){
          Auth.register($scope.user, config).then(function(user){
              $rootScope.user = user
              alert("Thanks for signing up, " + user.username);
              $state.go('home');
          }, function(errorResponse){
          });
      };

      $scope.login = function(){
          Auth.login($scope.user, config).then(function(user){
              $rootScope.user = user;
              $state.go('home');
          }, function(errorResponse){
          });
      }
  })
