mongoose = require 'mongoose'
module.exports = mongoose

mongoose.connect 'mongodb://localhost/minimum-trophy'

Schema = mongoose.Schema
ObjectID = Schema.ObjectId

ParticipantSchema = new Schema
    name     : { type : String,     required : true, unique: true },
    gender   : { type : String,     required : true },
    boulders : { type : [ Number ], required : true }


mongoose.model 'participant', ParticipantSchema
Participant = mongoose.model 'participant'


