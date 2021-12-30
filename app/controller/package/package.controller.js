const packageService = require("../../service/package.service")

class Package {

    async create(req, res) {
        try {
            const result = await packageService.create(req)
            res.status(200).send({
                status: 200,
                success: true,
                msg: "Package Has Been Created",
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };

    async get(req, res) {
        try {

            console.log(req.params,"--------")
            const result = await packageService.findById(req.params.id)
            res.status(200).send({
                status: 200,
                success: true,
                msg: "Package Has Been Fetched",
                data: result[0],
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };

    async gets(req, res) {
        try {

            const result = await packageService.find();
            res.status(200).send({
                status: 200,
                success: true,
                msg: "All Role Has Been Fetched",
                totalRole: result.length,
                data: result,
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };

    async delete(req, res) {
        try {

            const result = await packageService.delete(req.params.id)
            res.status(200).send({
                status: 200,
                success: true,
                msg: "Package Has Been Deleted",
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };

    async update(req, res) {
        try {

            const result = await packageService.update(req.params.id, req.body)
            console.log(req.body)
            res.status(200).send({
                status: 200,
                success: true,
                msg: "Role Has Been Updated",
            });
        } catch (error) {
            res.status(500).send({ success: false, msg: error.message });
        }
    };
}

const packageController = new Package();
module.exports = packageController;