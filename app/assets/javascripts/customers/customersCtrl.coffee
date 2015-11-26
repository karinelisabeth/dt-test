angular.module('Inv')
.controller 'customersCtrl', ['$scope', '$resource', 'Contacts', ($scope, $resource, Contacts) ->
    
    $scope.hello = "hello test"
    
    contacts = Contacts.query(-> 
    )
    
    $scope.contacts = contacts
      
    $scope.tablename = "customerTable"  
    
    $scope.tableajax =
        url: '/inventories'
        
    $scope.editorajax =
        create:
            url: '/inventories'
        
 ]
 
