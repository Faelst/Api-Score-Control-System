const db = require('../Database/Connect')
const { validationResult } = require('express-validator');

module.exports.registerSolicitation = async (req, res) => {

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }
    
}


//---------------------- Assigment_types -------------------------//
module.exports.getAssignmentTypes = async (req, res) => {
    try {
        const assigmentTypes = await db('assignment_types')
            .select('id', 'title')
            .where({
                deleted: 0,
                active: 1
            })
        res.status(200).send(assigmentTypes)
    } catch (error) {
        console.log(error)
        res.status(404).send({
            message: 'Bad request, try latter',
            status: false
        })
    }
}
//---------------------- Assigment_types -------------------------//

module.exports.getAssignmentLevels = async (req, res) => {
    try {
        
        const {id} = req.params;
        
        const assigmentLevels = await db('assignment_type_levels')
            .innerJoin('assignment_levels', 'assignment_levels.id', 'assignment_type_levels.assignment_level_id')
            .innerJoin('assignment_types', 'assignment_types.id' , 'assignment_type_levels.assignment_type_id ')
            .select('assignment_levels.id', 'assignment_levels.title', 'assignment_levels.score')
            .where({
                'assignment_types.id': id,
                'assignment_types.active': 1,
                'assignment_types.deleted': 0,
                'assignment_levels.active': 1,
                'assignment_levels.deleted': 0
            });

        res.status(200).send(assigmentLevels)
        
    } catch (error) {
        console.log(error)
        res.status(404).send({
            message: 'Bad request, try latter',
            status: false
        })
    }
}