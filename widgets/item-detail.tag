<item-detail>
  <div if={ opts.item }>
    <button onclick={unselect}>X</button>

    <h3>{ opts.item.title }</h3>
    <!-- <div><b>ID:</b> { opts.item.id }</div> -->
    <!-- <div><b>Name:</b> { opts.item.title }</div> -->
    <div><b>Synopsis:</b> { opts.item.synopsis }</div>
    <rg-tabs tabs="{ tabs }"></rg-tabs>
    <iframe src="/startups/test1/pdf-sample.pdf" style="width:718px; height:100%; min-height:700px;" frameborder="0"></iframe>

  </div>
  <style scoped>
    button {float: right;}
  </style>
  <script>
    var self= this
    self.tabs = new RgTabs({
      tabs: [{
        heading: 'Tab <em>one</em>',
        content: 'This is tab one'
      }, {
        heading: 'Tab two',
        content: 'This is tab two',
        active: true
      }, {
        heading: 'Disabled tab',
        content: 'This is disabled tab',
        disabled: true
      }]
    })

    unselect(){
      riot.route("view")
    }
  </script>
</item-detail>