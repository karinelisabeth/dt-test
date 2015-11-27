angular.module('Inv')
.controller 'productsCtrl', ['$scope', '$resource', 'Contacts', ($scope, $resource, Contacts) ->
  
    $scope.hello = "hello test"
  
    contacts = Contacts.query(-> 
    )
    
    $scope.tablecontacts = contacts
    
    $scope.tablecontacts.$promise.then (result) ->
      console.log("in promise " + result)

]

#*************************************************************
#** DATATABLE DIRECTIVE **
#*************************************************************

angular.module('Inv')
.directive 'productsTable', ['$q', ($q) ->
    restrict: 'A'
    scope:
      hello: "="
      tablecontacts: "=tablecontacts"
    link: (scope, element, attrs) ->
      console.log(scope.hello)
      scope.$watch 'tablecontacts', (new_value, old_value) ->
        if new_value
          console.log("in link " + scope.tablecontacts)
          console.log("in link new_value " + new_value)
          editor = new ($.fn.dataTable.Editor)
            'ajax':
              create:
                type: 'POST'
                url: '/inventories'
              edit:
                type: 'PUT'
                url: '/inventories/_id_'
              remove:
                type: 'DELETE'
                url: '/inventories/_id_'
            "table": '#products'
            "idSrc": "_id"
            'fields': [
                {
                  'label': 'SKU:'
                  'name': 'sku'
                }
                {
                  'label': 'Name:'
                  'name': 'name'
                }
                {
                  'label': 'Manufacturer:'
                  'name': 'manufacturer'
                }
                {
                  "label": 'Contact name:'
                  "name": 'contact_id'
                  "type": 'select'
                  "options": [{label: "test name 1", value: 1},{label: "test name 2", value: 2}, {label: "test name 3", value:3}]
                }
                {
                  'label': 'Cost:'
                  'name': 'cost'
                }
                {
                  'label': 'Weight:'
                  'name': 'weight'
                }
                {
                  'label': 'Stock:'
                  'name': 'stock'
                }
            ]
          element.DataTable
            'dom': 'Bfrtip'
            'ajax': 
              url: '/inventories'
              dataSrc: ''
            'columns': [
              { 'data': '_id' }
              { 'data': 'sku' }
              { 'data': 'name' }
              { 'data': 'manufacturer' }
              { "data": 'contact_name'}
              { 'data': 'cost' }
              { 'data': 'weight' }
              { 'data': 'stock' }
            ]
            select: true
            buttons: [
              {
                extend: 'create'
                editor: editor
              }
              {
                extend: 'edit'
                editor: editor
              }
              {
                extend: 'remove'
                editor: editor
              }
            ]
          return
]