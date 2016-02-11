<item-detail>
  <div if={ opts.item }>
    <button onclick={unselect}>X</button>

    <h3>{ opts.item.title }</h3>
    <!-- <div><b>ID:</b> { opts.item.id }</div> -->
    <!-- <div><b>Name:</b> { opts.item.title }</div> -->
    <div><b>Synopsis:</b> { opts.item.synopsis }</div>
    <rg-tabs tabs="{ tabs }"></rg-tabs>
    <iframe src="/startups/test1/pdf-sample.pdf" style="width:718px; height:100%; min-height:700px;" frameborder="0"></iframe>
    <discuss></discuss>
  </div>
  <style scoped>
    button {float: right;}
  </style>
  <script>
    var self= this
    self.tabs = new RgTabs({
      tabs: [{
        heading: 'Fichier 1',
        content: 'Fichier 1',
        active: true
      }, {
        heading: 'Fichier 2',
        content: 'Fichier 2'
      }, {
        heading: 'Fichier 3',
        content: 'Fichier 3'
      }]
    })

    unselect(){
      riot.route("view")
    }
  </script>
</item-detail>