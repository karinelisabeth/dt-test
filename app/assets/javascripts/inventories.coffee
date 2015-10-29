# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module('Inv', ["ngResource"])

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

#*************************
#** CONTROLLER **
#*************************

app.controller 'InventoryCtrl', ($scope, $resource) ->

  $scope.options =
    'paging': true




