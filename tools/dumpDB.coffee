Futures = require 'futures'

fs = require 'fs'
db = require '../database'

Participant = db.model 'participant'


Participant.find().sort('name', '1').exec (err, parts) ->
    for participant in parts
        data = "#{participant.name}:#{participant.gender}:#{participant.boulders}\n"
        console.log data
        fs.appendFile __dirname + '/results_12', data

