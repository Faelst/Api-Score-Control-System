const db = require('../Database/Connect')
const { validationResult } = require('express-validator');
const moment = require('moment');

module.exports.registerSolicitation = async (req, res) => {

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }

    let { serviceNumber, userId, serviceCity, issueDate, technicialId, assignmentType, levelsAssigment, descriotionService } = req.body
    let dubbedService = req.body.addTechinical ? 1 : 0


    try {
        const assignmentTypeId = await db('assignment_types').select('id').where({ title: assignmentType }).first()
        
        const [id] = await db('services')
             .insert({
                 "service_number": serviceNumber,
                "technical_id": technicialId,
                "user_id": userId,
                "city_id": serviceCity,
                "assignment_type_id": assignmentTypeId.id,
                "assignment_level_id": levelsAssigment,
                "issue_date": moment().format(),
                "execute_date": moment(issueDate, "DD/MM/YYYY").format("YYYY-MM-DD"),
                "descriotion_service": descriotionService,
                "dubbed_service": dubbedService
            })
        
        if (dubbedService && req.body.addTechinical) {
            let {addTechinical} = req.body
            addTechinical.map(async element => {
                await db(`dubbed_services`)
                    .insert({
                        service_id: id,
                        technical_id: element.id,
                        follow_type_code: element.followType == "Auxiliar" ? 0 : 1,
                        follow_type_desc: descriotionService
                    })
            })
        }

        return res.status(200).send({
            status: true,
            data: id
        })


    } catch (e) {
        console.log(e)
    }

}

module.exports.getTechnicals = async (req, res) => {
    let filter = {}
    if (req.body.nameTechnician && req.body.nameTechnician !== "0")
        filter.name = req.body.nameTechnician

    if (req.body.idTechnician && req.body.idTechnician !== "0")
        filter.id = req.body.idTechnician
    const technicals = await db('technicals').where(filter)

    if (!technicals.length) {
        return res.send({
            status: false,
            message: 'Not found any techinical'
        })
    }

    res.status(200).send({
        status: true,
        data: technicals
    })

}

// ------------------------------- Cities -------------------------------------------------//
module.exports.getCities = async (req, res) => {
    try {
        const cities = await db('cidade')
            .select('id_cidade', 'nome_cidade');
        return res.status(200).send({
            status: true,
            data: cities
        })
    } catch (e) {
        console.log(e)
        res.status(404).send({
            message: 'Bad request, try latter',
            status: false
        })
    }
}
// ------------------------------- Cities -------------------------------------------------//


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

        const { id } = req.params;

        const assigmentLevels = await db('assignment_type_levels')
            .innerJoin('assignment_levels', 'assignment_levels.id', 'assignment_type_levels.assignment_level_id')
            .innerJoin('assignment_types', 'assignment_types.id', 'assignment_type_levels.assignment_type_id ')
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