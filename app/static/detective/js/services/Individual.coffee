angular.module('detectiveServices').factory("Individual", [ '$resource', '$http', ($resource, $http)->
    $resource '/api/:scope/v1/:type/:id/', { scope: "base" }, {
        query: {
            method : 'GET', 
            isArray: true,
            cache  : true,
            transformResponse: $http.defaults.transformResponse.concat([(data, headersGetter) ->
                data.objects
            ])
        },
        save: {
            url:'/api/:scope/v1/:type/#',
            method : 'POST', 
            isArray: false,
            paramDefaults: {
                scope: "base"
            }
        }
    }
])