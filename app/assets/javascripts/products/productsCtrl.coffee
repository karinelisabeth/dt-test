angular.module('Inv')
.controller 'productsCtrl', ['$scope', '$resource', 'Contacts', ($scope, $resource, Contacts) ->
  
    $scope.hello = "hello test"
  
    contacts = Contacts.query(-> 
        console.log(contacts)
    )
    
    $scope.contacts = contacts

]

#*************************************************************
#** DATATABLE DIRECTIVE **
#*************************************************************


angular.module('Inv')
.directive 'productsTable', [ ->
    restrict: 'A'
    # scope:
    #   tablecontacts: "="
    link: (scope, element, attrs) ->
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
            # {
            #   "label": "Contact name:"
            #   "name": "contact_name"
            # }
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
          # { "data": "contact_name"}
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