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
      
    $urlRouterProvider.otherwise 'products'
    return
]


#*************************************************************
#** DATATABLE DIRECTIVE from http://jsfiddle.net/TNy3w/611/ **
#*************************************************************

app.directive 'myTable', [ ->
  {
    restrict: 'A'
    scope:
      tableAjax:"=tableAjax"
      tabledom:"=tabledom"
    link: (scope, element, attrs) ->
      editor = new ($.fn.dataTable.Editor)(
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
        ])
      element.DataTable
        'dom':scope.tabledom
        'ajax':scope.tableAjax
        'columns': [
          { 'data': '_id' }
          { 'data': 'sku' }
          { 'data': 'name' }
          { 'data': 'manufacturer' }
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
  }
 ]

  




