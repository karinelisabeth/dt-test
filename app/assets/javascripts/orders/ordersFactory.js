(function() {
   
    angular.module('Inv')
    .factory('ordersFactory', ['$http', function($http) {
        // console.log("in ordersFactory");
        // console.log("http request" + $http.get('/orders'))
        // return $http.get('/orders');
        
         return $http({
            method: 'GET',
            url: '/orders'
         });
    
    }]);
    
//     angular.module('Inv')
//     .controller('orderFactory', ['$http', '$stateParams', function($http,$stateParams) {
    
//     $http.get("/orders/" + $stateParams.id)
//             .then(function(res){ 
//                 return res.data; 
//             }, function errorCallback(response) {
//              console.log("error" + response);
//         });
//   }]);
   
   
}());

