WpSnippetsView = require './wp-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = WpSnippets =
  wpSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @wpSnippetsView = new WpSnippetsView(state.wpSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @wpSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'wp-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @wpSnippetsView.destroy()

  serialize: ->
    wpSnippetsViewState: @wpSnippetsView.serialize()

  toggle: ->
    console.log 'WpSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
