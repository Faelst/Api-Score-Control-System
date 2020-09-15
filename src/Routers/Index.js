const express = require('express');
const router = express.Router();
const Api = require('../Api');
const { registerSolicitationValidator } = require('../Middleware/Validators.js')



//---------------------- Assigment_types -------------------------//
router.get('/assignmentTypes', Api.getAssignmentTypes)
//---------------------- Assigment_types -------------------------//


//---------------------- Assigment_levels -------------------------//
router.get('/assignmentLevels/:id', Api.getAssignmentLevels)
//---------------------- Assigment_levels -------------------------//


router.post('/registerSolicitation', registerSolicitationValidator, Api.registerSolicitation);



module.exports = router;