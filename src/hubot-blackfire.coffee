# Description
#   Have hubot profile websites for you with blackfire via curl!
#
# Configuration:
#   Must have blackfire correctly set up on the same server Hubot is installed to.
#
# Commands:
#   hubot blackfire <slot> <url> - profiles a url to a given slot
#
# Notes:
#   This WILL overwrite the slot that is passed to the script. *There is no safety net and this cannot be undone.
#
#
#   *Ok, I suppose there's a chance Sensiolabs could undo it. But I highly doubt it.
#
# Author:
#   Michael Hopkins[@<org>]

module.exports = (robot) ->
  robot.respond /blackfire (\d+) (.*)/i, (msg) ->
    slot = msg.match[1]
    url = msg.match[2]
    @exec = require('child_process').exec
    command = "blackfire curl --slot #{slot} #{url}"

    msg.send "Profiling #{url}..."

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr