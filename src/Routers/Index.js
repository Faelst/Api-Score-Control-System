const Api = require('../Api');

module.exports = function (router) {
    router.get('/authentication', Api.authentication)
    
    router.get('/authorizationService' , Api.authorizationService)
}