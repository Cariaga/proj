
const express = require('express')
const helmet = require('helmet')
const app = express()

app.use(helmet.noSniff())
app.use(helmet.xssFilter());
app.use(helmet.frameguard());
app.use(helmet.dnsPrefetchControl());
app.use(helmet.ieNoOpen());
app.use(helmet.permittedCrossDomainPolicies());
app.use(helmet.noCache());
app.use(helmet.referrerPolicy({ policy: 'same-origin' }));

app.use(helmet.hidePoweredBy())

const sixtyDaysInSeconds = 5184000
app.use(helmet.hsts({
  maxAge: sixtyDaysInSeconds
}))

app.use(helmet.contentSecurityPolicy({
  directives: {
    defaultSrc: ["'self'"],
    styleSrc: ["'self'",]
  }
}))

app.use(helmet.featurePolicy({
  features: {
    fullscreen: ["'self'"],
    syncXhr: ["'none'"]
  }
}))

app.get('/', function (req, res) {
  res.send('Dockerized1');
})

var server = app.listen(8080, function () {
  var host = server.address().address
  var port = server.address().port
  
  console.log("Example app listening at http://%s:%s", host, port)
})

