<gpi-app>

  <h1>
    GPI: {startupname}
    <a href="https://github.com/jimsparkman/RiotControl"></a>
  </h1>

  <item-app
    if={page == "view" || page == ""}
    detail={detail}>
  </item-app>

  <foo if={page == "foo"}>
  </foo>

<!-- ------------- -->

  <style scoped>
    h1 {
      background: rgb(235, 230, 255);
      font-size: 24px;
      margin: 0;
      padding: 10px;
    }
  </style>

<!-- ------------- -->


  <script>
    var self = this
    self.page = "ok"
    self.detail = 0
    self.startupname =""

    RiotControl.on('item_detail_changed', function(item) {
      console.log("lmao",item)
      self.startupname = item ? item.title : ""
      riot.update()
    })

    RiotControl.on('page-change', function(page) {
      self.page = page.name
      RiotControl.trigger("get-startup-infos",parseInt(page.data))
      riot.update()
    })
  </script>

</gpi-app>