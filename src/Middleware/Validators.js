const { check } = require('express-validator')

module.exports.registerSolicitationValidator = [
    check('serviceNumber').exists().isInt({ min: 4 }).withMessage("Not found/incorrect 'serviceNumber'"),
    check('serviceCityId').exists().isInt({ min: 1, max: 4 }).withMessage("Not found/incorrect 'serviceCityId'"),
    check('issueDate').exists().withMessage('issue Date Not Found'),
    check('technicialId').exists().isInt({ min: 3 }),
    check('technicianName').exists().isLength({ min: 10 }),
    check('assignmentType').exists(),
    check('levelsAssigmentId').exists().isLength({ min: 1 }),
    check('descriotionService').exists().isLength({ min: 10 }),
]