(function() {
   
    angular.module('Inv')
    .controller('ordersCtrl', ['$scope','$http', '$stateParams', function($scope,$http,$stateParams) {
        
        
         $http({
            method: 'GET',
            url: '/orders'
         }).then(function successCallback(response) {
             
             $scope.orders = response.data;
             
        }, function errorCallback(response) {
             // called asynchronously if an error occurs
             // or server returns response with an error status.
        });
    
    }]);
    
    angular.module('Inv')
    .controller('orderCtrl', ['$scope','$http', '$stateParams', function($scope,$http,$stateParams) {
    
    $http.get("/orders/" + $stateParams.id)
            .then(function(res){ 
                $scope.order = res.data; 
            }, function errorCallback(response) {
             console.log("error" + response);
        });
   }]);
   
   
}());

