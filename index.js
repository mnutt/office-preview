const http = require('http');
const previewDocument = require('./src/preview-document');
const staticServer = require('./src/static-server');

const port = process.env.PORT || 8577;

http.createServer(function (req, res) {
  if (req.url.startsWith('/preview') && req.method === 'POST') {
    previewDocument(req, res);
  } else {
    staticServer(req, res);
  }
}).listen(port, () => {
  console.log(`Listening on port ${port}`);
});
