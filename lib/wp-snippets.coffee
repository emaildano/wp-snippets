WpSnippetsView = require './wp-snippets-view'

module.exports =
  wpSnippetsView: null

  activate: (state) ->
    @wpSnippetsView = new WpSnippetsView(state.wpSnippetsViewState)

  deactivate: ->
    @wpSnippetsView.destroy()

  serialize: ->
    wpSnippetsViewState: @wpSnippetsView.serialize()
