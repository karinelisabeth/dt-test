angular.module('Inv').controller 'customersCtrl', ['$scope', '$resource', ($scope, $resource) ->
    
    # test that ctrl is wired up correctly
    $scope.hello = "hey"
  
    
    $scope.tableAjax =
       'ajax':
          'url': '/inventories'
          'dataSrc': ''
    
    $scope.tabledom =
      'dom': 'Bfrtip'
      
      ]
  
    #Inven = $resource('/inventories')
    #
    #inven1 = Inven.get({sku: "123"}, ->
        #console.log inven1
        #return
    #)
    
    #testarray = GetHeaders (inven)
    #
     #http://stackoverflow.com/questions/1876485/get-property-names-in-json-objects
    #GetHeaders = (obj) ->
        #cols = new Array
        #p = obj[0]
        #for key of p
            #cols.push key
        #cols
    
    
    #customerTableSettings = ->
      #settings = tableSettings
      #settings.ajax.url = '/inventories'
      #settings.columns = [
        #{ 'data': '_id' }
        #{ 'data': 'sku' }
        #{ 'data': 'name' }
        #{ 'data': 'manufacturer' }
        #{ 'data': 'cost' }
        #{ 'data': 'weight' }
        #{ 'data': 'stock' }
      #]
      #return settings
      
    
    # data-tables options, for directive 'myTable' in myApp.coffee
    #$scope.optionsDT =  customerTableSettings()

        
    #] # end angular.module('Inv')
    
    
    
    
    
    #other code- to add
            #select: true
        #buttons: [
            #{ extend: "create", editor: editor }
            #{ extend: "edit",   editor: editor }
            #{ extend: "remove", editor: editor }
        #]