angular.module('Inv')
.controller 'customersCtrl', ['$scope', '$resource', 'Contacts', ($scope, $resource, Contacts) ->
      
    $scope.tablename = "customerTable"  
    
    $scope.tableajax =
        url: '/inventories'
        
    $scope.editorajax =
        create:
            url: '/inventories'
        
 ]
 
