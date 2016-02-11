<gpi-app>
  <div class="container">
    <div class="navbar-header">
      <a href="../"
        class="navbar-brand"
        style="color: #563d7c;font-weight: 500;">
        GPI: Revues des candidats
      </a>
    </div>
  </div>
<!-- </header> -->
<!--
  <h1>
    GPI: Revues des candidats
    <a href="https://github.com/jimsparkman/RiotControl"></a>
  </h1>
 -->
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