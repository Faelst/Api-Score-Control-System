const express = require('express')
const server = express()
const router = express.Router();
const port =  process.env.PORT || 8080;
const cors = require('../Config/Cors.js')
const { graphqlHTTP } = require('express-graphql');


server.use(
    '/graphql',
    graphqlHTTP({
      schema: MyGraphQLSchema,
      graphiql: true,
    }),
  );

server.use(cors)
server.listen(port ,() => console.log(`http://localhost:${port}`))
server.use('/api' , router)

module.exports = router