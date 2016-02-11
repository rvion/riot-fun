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
          <div style="display:inline-block" if={done}>
            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
          </div>
          <a class={selected: detail.id == id} href={ '#view/' + id }>{ title }</a>
          <div class="notepannel"
            if={selected: detail.id == id}
            each={ [{a:"lien avec Paris"},{a:"barrières à l'entrée"},{a:"Ecologique"},{a:"sympa"}] }
          >
            {a}:<br>
              <div class="btn-group">
                <button type="button" class="btn btn-sm btn-default" aria-label="Left Align">1</button>
                <button type="button" class="btn btn-sm btn-default" aria-label="Center Align">2</button>
                <button type="button" class="btn btn-sm btn-default" aria-label="Right Align">3</button>
                <button type="button" class="btn btn-sm btn-default" aria-label="Justify">4</button>
              </div>
          </div>
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
    .notepannel {margin-left: 30px}
    a.selected{background: #EBE6FF;}
    th{background: rgb(222, 224, 232);}
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