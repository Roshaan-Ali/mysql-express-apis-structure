const languageService = require("../../service/language.service")

class Language {
    async create(req, res) {
        try {
            const result = await languageService.create(req)
            res.status(200).send({
                status: 200,
                success: true,
                msg: "Language Has Been Created",
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };

    // async get(req, res) {
    //     try {

    //         const result = await categoryService.findOne({ _id: req.params.id })
    //         console.log(req.body)
    //         res.status(200).send({
    //             status: 200,
    //             success: true,
    //             msg: "Role Has Been Fetched",
    //             data: result,
    //         });
    //     } catch (error) {
    //         res.status(500).send({ success: false, msg: error.message });
    //     }
    // };

    async gets(req, res) {
        try {

            const result = await languageService.find();
            res.status(200).send({
                status: 200,
                success: true,
                msg: "All Language Has Been Fetched",
                totalRole: result.length,
                data: result,
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };

    async delete(req, res) {
        try {
            const result = await languageService.delete(req.params.id)
            res.status(200).send({
                status: 200,
                success: true,
                msg: "Language Has Been Deleted",
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };

    async update(req, res) {
        try {

            const result = await languageService.update(req.params.id, req.body)
            console.log(req.body)
            res.status(200).send({
                status: 200,
                success: true,
                msg: "Language Has Been Updated",
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };
}

const languageController = new Language();
module.exports = languageController;