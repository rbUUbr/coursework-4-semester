angular.module('bsuirSchedule')
    .factory('posts', [
        '$http',
        function($http) {
            var o = {
                groups: []
            };

            o.getAll = function() {
                return $http.get('/groups.json').success(function(data) {
                    angular.copy(data, o.groups);
                });
            };

            o.get = function(id) {
                return $http.get('/groups/' + id + '.json').then(function(res) {
                    return res.data;
                });
            };

            o.create = function(post) {
                return $http.post('/groups.json', post).success(function(data) {
                });
            };

            return o;
        }
    ]);