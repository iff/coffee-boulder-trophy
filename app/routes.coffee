{ _ }      = require 'underscore'
{ render } = require './app'

db          = require '../database'
Participant = db.model 'participant'


app.get '/', (req, res) ->
    req.participants = {}
    Participant.find().sort('name', '1').exec (err, parts) ->
        console.log err if err
        req.participants = parts
        render req, res, 'ranking'

app.post '/add', (req, res) ->

    # parse climbed boulders
    boulders = []
    for boulder in req.body.boulders.split ","
        boulder_range = boulder.split "-"
        if boulder_range.length is 1
            boulders.push parseInt(boulder_range[0])
        else
            range = [parseInt(boulder_range[0])..parseInt(boulder_range[1])]
            boulders = boulders.concat range

    # do not count duplicated entries
    boulders = _.uniq boulders, false
    data = { name: req.body.name, gender: req.body.gender, boulders: boulders}

    # if participant already exists we perform update
    Participant.findOne {'name': req.body.name}, (err, part) ->
        if part
            part.gender = data.gender
            part.boulders = boulders
            part.save()
            res.redirect '/'
        else
            new Participant(data).save (err, part) ->
                console.log err if err
                res.redirect '/'


app.get '/about', (req, res) ->
    render req, res, 'about'

# ----------------------------------------------------------------------------
# Catch-all-route
# ----------------------------------------------------------------------------
#
app.get '*', (req, res) ->
    render req, res, 404, 'Seite nicht gefunden!'

