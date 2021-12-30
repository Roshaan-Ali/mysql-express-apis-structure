exports.concateWhereString = (where) => {
    where.push("");
    console.log(where, "data")
    let str = `where ${where.join("=? And ")}`;
    str = str.slice(0, -5);
    return str;
}

exports.concateUpdateString = (updat) => {
    updat.push("");
    let str = updat.join("=?, ");
    str = str.slice(0, -2);
    return str;
}

exports.seprateKeysValues = (obj) => {
    // console.log(obj, "obj")
    let fieldkeys = [];
    let fieldValues = [];
    for (const [key, value] of Object.entries(obj)) {
        fieldkeys.push(key);
        fieldValues.push(value);
    }
    return [fieldkeys, fieldValues];

}

exports.concateInsertKeysString = (keys) => {
    console.log(keys, "data")
    keys.push("");
    let str = `${keys.join(", ")}`;
    str = str.slice(0, -2);
    console.log(str, "lol")
    return str;
}

exports.concateInsertValuesString = (keys) => {
    let str = "";
    for (let i = 0; i < keys.length; i++) {
        str = str + "?, "
    }
    str = str.slice(0, -5);
    return str;
}

//**********************************validation********************************* */

exports.addString = (validateType) => {
    console.log(validateType, "ddd")
    let str = 'Joi.';
    for (let i = 0; i < validateType.length; i++) {
        str = `${str}${validateType[i]}().`
    }
    str = str.slice(0, -1);
    str = str.replace(/['"]+/g, '')
    console.log(str, "str");
    return str;
}