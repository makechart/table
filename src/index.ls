module.exports =
  pkg:
    name: 'table', version: '0.0.1'
    extend: {name: "empty", version: "0.0.1"}
    dependencies: [
      {url: "/assets/lib/gridjs/main/gridjs.production.min.js"}
      {url: "/assets/lib/gridjs/main/theme/mermaid.min.css"}
    ]
  init: ({root, context, pubsub}) ->
    {gridjs} = context
    pubsub.fire \init, {
      layout: false
      prepare-svg: false
      mod: {
        init: ->
          @grid = grid = new gridjs.Grid do
            columns: [' ','  ','   ','    ','      '],
            height: "#{@root.getBoundingClientRect!height}px"
            fixedHeader: true,
            sort: true
            search: false
            resizable: true
            data: [] ++ [0 to 10].map -> []
          grid.render @root
        parse: ->
          head = [k for k of (@raw.0 or {})]
          head.length 
          raw = @raw
          console.log raw
          return
          @grid.updateConfig {
            columns: raw.0
            data: raw.slice(1) ++ [0 to (20 - raw.length) >? 0 ].map(->[])
          } .forceRender!
      }
    }
