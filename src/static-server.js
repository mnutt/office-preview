const fs = require('fs');

module.exports = function(_req, res) {
  const file = fs.createReadStream('./static/index.html');
  file.pipe(res);
};
