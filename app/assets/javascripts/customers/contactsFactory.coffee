angular.module('Inv')
.factory 'Contacts', [ '$resource', ($resource) ->
    
    res = $resource '/contacts.json', {}, query:
            method: 'GET'
            isArray: true
            transformResponse: (data, header) ->
                jsonData = JSON.parse(data)
                list = []
                
                angular.forEach jsonData, (item) ->
                    list.push item.name
                
                return list
    res
]