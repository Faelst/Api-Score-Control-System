const express = require('express');
const router = express.Router();
const Api = require('../Api');
const { registerSolicitationValidator } = require('../Middleware/Validators.js')



//---------------------- Assigment_types -------------------------//
router.get('/assignmentTypes', Api.getAssignmentTypes)
//---------------------- Assigment_types -------------------------//


//---------------------- cities -------------------------//
router.get('/cities', Api.getCities);
//---------------------- cities -------------------------//


//---------------------- Assigment_types -------------------------//
router.post('/technicals', Api.getTechnicals)
//---------------------- Assigment_types -------------------------//


//---------------------- Assigment_levels -------------------------//
router.get('/assignmentLevels/:id', Api.getAssignmentLevels)
//---------------------- Assigment_levels -------------------------//


//---------------------- register form -------------------------//
router.post('/registerSolicitation', Api.registerSolicitation);
//---------------------- register form -------------------------//

//---------------------- service list -------------------------//
router.get('/services', Api.getServices);
router.get('/service/:id', Api.getServiceById);
//---------------------- service list -------------------------//



module.exports = router;