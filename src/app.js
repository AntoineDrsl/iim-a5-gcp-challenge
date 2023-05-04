const functions = require('@google-cloud/functions-framework');

functions.http('main', (req, res) => {
	res.status(200).send('Hello World !');
});