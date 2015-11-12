# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module('Inv', ["ngResource","ui.bootstrap","ui.router","templates"])

#angular.module('Inv').controller 'customersCtrl', ['$scope', '$resource', ($scope, $resource) ->


angular.module('Inv').controller 'productsCtrl', ['$scope', ($scope) ->
  $scope.options =
    'paging': true
]

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

app.directive 'myTable', ->
  {
  restrict: 'E, A, C'
  link: (scope, element, attrs, controller) ->
    dataTable = element.dataTable(scope.options)

# If you want instead to have a bi-directional binding between the parent scope and the local scope, you should use the = equality character
  scope:
    options: '='
  }





