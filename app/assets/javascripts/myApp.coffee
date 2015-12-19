# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module('Inv', ["ngResource","ui.bootstrap","ui.router","templates"])

# checks which is the active URL. From http://stackoverflow.com/questions/16199418/how-do-i-implement-the-bootstrap-navbar-active-class-with-angular-js
# answer 27
app.controller 'navCtrl', ['$scope', '$location', ($scope, $location) ->
  $scope.isActive = (viewLocation) ->
    active = viewLocation == $location.url()
    active
]

app.config [ '$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    
    $stateProvider
    .state 'products',
      url: '/products'
      templateUrl: 'products/_products.html'
      controller: 'productsCtrl'
      
    .state 'customers',
      url: '/customers'
      templateUrl: 'customers/_customers.html'
      controller: 'customersCtrl'
      
    .state 'orders',
      url: '/orders'
      templateUrl: 'orders/_orders.html'
      controller: 'ordersCtrl'
      
    .state 'order',
      url: '/orders/:id/edit'
      templateUrl: 'orders/_edit-order.html'
      controller: 'orderCtrl'
      
    $urlRouterProvider.otherwise 'products'
    
    return
]


#*************************************************************
#** DATATABLE DIRECTIVE **
#*************************************************************


.directive 'myTable', [ ->
    restrict: 'A'
    scope:
      tableajax: "="
      editorajax: "="
      tablename: "="
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
        "table": '#' + scope.tablename
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
          url: scope.tableajax.url
          # dataSrc: ''
        'columns': [
              { 'data': 'DT_RowId' }
              { 'data': 'inventories.sku' }
              { 'data': 'inventories.name' }
              { 'data': 'inventories.manufacturer' }
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
  




