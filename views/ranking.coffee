View  = require '../view'
{ _ } = require 'underscore'

class RankingView extends View

    rankData: ->
        for participant in @req.participants

            # clumsy way of creating intervals again
            bs = []
            first = -1
            boulders = participant.boulders
            boulders.sort (lhs, rhs) ->
                return lhs - rhs
            for i in [0...boulders.length]
                if i+1 < boulders.length and boulders[i+1] is boulders[i] + 1
                    if first is -1
                        first = boulders[i]
                else
                    if first isnt -1
                        bs.push "#{first}-#{boulders[i]}"
                        first = -1
                    else
                        bs.push "#{boulders[i]}"

            participant.boulders_short = bs
            participant

    ranking: ->
        total_points_per_boulder = 100.0
        total_boulders = 60

        points = { 'm': [], 'f': [] }
        for i in [0..total_boulders]
            points['m'].push 0
            points['f'].push 0

        for participant in @req.participants
            for boulder in participant.boulders
                points[participant.gender][boulder] += 1

        points['m'] = _.map points['m'], (boulder) ->
            return total_points_per_boulder / boulder

        points['f'] = _.map points['f'], (boulder) ->
            return total_points_per_boulder / boulder

        participants = @req.participants
        for participant in participants
            @gender = participant.gender
            sum = 0.0
            sum = _.reduce participant.boulders, ((sum, boulder) =>
                return sum + points[@gender][boulder]), 0

            participant.points = sum.toFixed 2

        ranked = _.values(participants).sort (lhs, rhs) ->
            rhs.points - lhs.points

        return ranked

module.exports = RankingView
