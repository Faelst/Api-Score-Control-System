
const App = require('./Server')
const port = process.env.PORT || 8080;

App.listen(port, () => console.log(`http://localhost:${port}`));
