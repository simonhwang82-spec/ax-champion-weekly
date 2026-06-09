const http = require('http');
const fs = require('fs');
const path = require('path');
const server = http.createServer((req, res) => {
  const filePath = path.join('C:\\Users\\Alex_02\\Dreamus AX\\ax-weekly-04', req.url === '/' ? 'index.html' : req.url);
  fs.readFile(filePath, (err, data) => {
    if (err) { res.writeHead(404); res.end('Not found'); return; }
    const ext = path.extname(filePath);
    const mime = {'.html':'text/html','.css':'text/css','.js':'application/javascript'};
    res.writeHead(200, {'Content-Type': mime[ext] || 'text/plain; charset=utf-8'});
    res.end(data);
  });
});
server.listen(3000, () => { process.stdout.write('READY\n'); });
