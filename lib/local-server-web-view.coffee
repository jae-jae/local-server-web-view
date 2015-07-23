{exec} = require('child_process')
Shell = require('shell')
path = require "path"
projectPath = atom.project.getPaths()[0]

serverPath = ""
# Personal Project Server URL Configuration
switch projectPath
    when "C:\\xampp\\htdocs/franzenit" then (serverPath = "franzenit.localhost:8081/")
    when "C:\\xampp\\htdocs\\franzenit" then (serverPath = "franzenit.localhost:8081/")
    when "C:\\xampp\\htdocs/ThePitCrewAutomotive" then (serverPath = "thepitcrew.localhost:8081/")
    when "C:\\xampp\\htdocs\\ThePitCrewAutomotive" then (serverPath = "thepitcrew.localhost:8081/")
    when "C:\\xampp\\htdocs/SabuWorks" then (serverPath = "sabuworks.localhost:8081/")
    when "C:\\xampp\\htdocs\\SabuWorks" then (serverPath = "sabuworks.localhost:8081/")
    when "C:\\xampp\\htdocs/QuizAnswers" then (serverPath = "quizanswers.localhost:8081/")
    when "C:\\xampp\\htdocs\\QuizAnswers" then (serverPath = "quizanswers.localhost:8081/")
    when "C:\\xampp\\htdocs/amandaConley" then (serverPath = "amandaconley.localhost:8081/")
    when "C:\\xampp\\htdocs\\amandaConley" then (serverPath = "amandaconley.localhost:8081/")
    # Template to Add New Host
    # when "{file_path}" then (serverPath = "{prepend_url}")
    # when "{file_path_aternate}" then (serverPath = "{prepend_url}")
    else (serverPath = "localhost:8081/")

module.exports =
  activate: (state) ->
    atom.commands.add 'atom-text-editor', 'local-server-web-view:open': => @open()

  openPath: (filePath) ->
    Shell.openExternal("http://"+serverPath+filePath)
    #   alert(projectPath)

  open: ->
    editor = atom.workspace.getActivePaneItem()
    file = editor?.buffer.file
    goalPath = file?.path
    @openPath atom.project.relativize(goalPath)
