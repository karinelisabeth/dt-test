(function() {
   
    angular.module('Inv')
    .controller('ordersCtrl', ['$scope', '$http', '$stateParams', function($scope, $http, $stateParams) {
        
        // ordersFactory.success(function(data) {
        //     $scope.orders = data;
        //     console.log("orders: " + JSON.stringify($scope.orders));
        // });
        
        //not using below function, only the one above
        // ordersFactory.then(function successCallback(response) {
             
        //      $scope.orders = response.data;
             
        // }, function errorCallback(response) {
        //      console.log("error" + response);
        // });
        
    }]);
    
//     angular.module('Inv')
//     .controller('orderCtrl', ['$scope','$http', '$stateParams', function($scope,$http,$stateParams) {
    
//     $http.get("/orders/" + $stateParams.id)
//             .then(function(res){ 
//                 $scope.order = res.data; 
//             }, function errorCallback(response) {
//              console.log("error" + response);
//         });
//   }]);
   
   
}());

