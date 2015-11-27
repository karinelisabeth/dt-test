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
            # "idSrc": "_id"
            'fields': [
                {
                  'label': 'SKU:'
                  'name': 'inventories.sku'
                }
                {
                  'label': 'Name:'
                  'name': 'inventories.name'
                }
                {
                  'label': 'Manufacturer:'
                  'name': 'inventories.manufacturer'
                }
                {
                  "label": 'Contact name:'
                  "name": 'inventories.contact_id'
                  "type": 'select'
                }
                {
                  'label': 'Cost:'
                  'name': 'inventories.cost'
                }
                {
                  'label': 'Weight:'
                  'name': 'inventories.weight'
                }
                {
                  'label': 'Stock:'
                  'name': 'inventories.stock'
                }
            ]
          element.DataTable
            'dom': 'Bfrtip'
            'ajax': 
              url: '/inventories'
              # dataSrc: ''
            'columns': [
              { 'data': 'DT_RowId' }
              { 'data': 'inventories.sku' }
              { 'data': 'inventories.name' }
              { 'data': 'inventories.manufacturer' }
              { 'data': 'contacts.name'}
              { 'data': 'inventories.cost' }
              { 'data': 'inventories.weight' }
              { 'data': 'inventories.stock' }
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