angular.module('bsuirSchedule')
    .factory('groups', [
        '$http',
        function($http) {
            var o = {
                groups: []
            };
                o.getAll = function() {
                return $http.get('/groups.json').then(function(data) {
                    angular.copy(data.data, o.groups);
                });
            };
            return o;
        }
    ]);
