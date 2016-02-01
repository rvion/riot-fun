<item-app>

  <table class='table table-bordered'>
  <tr>
    <th>Startups</th>
    <th>Documents</th>
    <!-- <th>Notes</th> -->
  </tr>
  <tr>

    <td class="left-pane">
      <div if={ !edit }>
      <input name='input' placeholder='Filter..' onkeyup={ search }>

      <form onsubmit={ clear }>
        <button disabled={ !txt }>Clear</button>
      </form>

      <h4>Startups</h4>
      <ul>
        <li each={ items }>
          <a href={ '#view/' + id }>{ title }</a>
        </li>
      </ul>
      <gpi-votes-add-startup>
      </gpi-votes-add-startup>
    </td>

    <td>
      <item-detail item={ detail }></item-detail>
      <div if={ !detail }>
        <span>Choose a startup.</span>
      </div>
      <!-- <div if={ detail }> -->
        <!-- <iframe src="/startups/test1/pdf-sample.pdf" style="width:718px; height:700px;" frameborder="0"></iframe> -->
      <!-- </div> -->
    </td>

    <!--
    <td>
      <form>
      <startup-note></startup-note>
      </form>
    </td>
    -->

  </tr>
  </table>

  <!-- style -->
  <style scoped>
    .left-pane{width: 250px;}
    .table {width: 100%px; }
    form {display: inline-block; }
  </style>

  <script>
  var self = this

  self.items = []
  self.txt = null
  self.detail = null

  search(e) {
    self.txt = e.target.value
    RiotControl.trigger('item_list_search', self.txt)
  }

  clear(e) {
    self.txt = ''
    this.input.value = ''
    RiotControl.trigger('item_list_search','')
  }

  self.on('mount', function() {
    RiotControl.trigger('item_list_init')
  })

  RiotControl.on('item_list_changed', function(items) {
    self.items = items
    self.update()
  })

  RiotControl.on('item_detail_changed', function(item) {
    self.edit = false
    self.detail = item
    console.log("info to print")
    riot.update()
  })

  </script>


</item-app>