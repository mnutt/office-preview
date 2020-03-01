const { pipeline } = require('stream');
const unoconv = require('./unoconv');

module.exports = function(req, res) {
  let converter = unoconv('unoconv');

  const filename = req.headers['x-file-name'] || '';

  converter.outputFormat('xhtml');
  converter.set('-T 30'); // timeout after 30s

  if (filename.match(/\.(xls|xlsx|ods)$/)) {
    converter.set('-d spreadsheet');
  } else if (filename.match(/\.(ppt|pptx|odp)$/)) {
    converter.set('-d presentation');
  }

  converter.on('error', function(err) {
    if (!err.toString().match(/validity error/)) {
      console.error(err);
    }
  });

  pipeline(req, converter, res);
};
