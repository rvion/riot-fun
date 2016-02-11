<gpi-votes-add-startup>
  <div if={ !edit }>
    <button class="btn btn-primary btn-sm" onclick={ add }>Admin: Ajouter Dossier Startup</button>
  </div>

  </div>

  <div if={ edit }>
    <form onsubmit={ submit }>
      <input name='title'>
      <button>Ajouter</button>
    </form>
    <button onclick={ cancel }>Anuler</button>
  </div>

  <style scoped>
    /*button {float: left;}*/
  </style>

  <script>
    var self = this
    self.edit = false;

    add(e) {
      self.edit = true
      riot.update()
      // riot.route('view/add')
    }

    submit(e) {
      RiotControl.trigger('item_detail_add', this.title.value)
      this.title.value = ''
      this.edit = false
      // riot.route('view')
    }

    cancel(e) {
      this.title.value = ''
      this.edit = false
      riot.route('view')
    }

  </script>
</gpi-votes-add-startup>