// Manages our item data locally, for now.
function ItemStore() {
  riot.observable(this)
  var self = this

  // Could pull this from a server API.
  var sample_doc = {title: "sample1", pdf: "/startups/test1/pdf-sample.pdf"}
  var sample_docs = [sample_doc]
  var syno = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  self.items = [
    { done: true, id: 1, docs: sample_docs, synopsis: syno, title: 'startup 1' },
    { done: true, id: 2, docs: sample_docs, synopsis: syno, title: 'analutoc' },
    { done: true, id: 3, docs: sample_docs, synopsis: syno, title: 'wakaboom' },
    { done: true, id: 4, docs: sample_docs, synopsis: syno, title: 'story driven pro' },
    { done: false, id: 5, docs: sample_docs, synopsis: syno, title: 'adsbooster' },
    { done: false, id: 6, docs: sample_docs, synopsis: syno, title: 'moneyManager' }
  ]

  // Init our list view.
  self.on('item_list_init', function() {
    self.trigger('item_list_changed', self.items)
  })

  // Search our item collection.
  self.on('item_list_search', function(txt) {
    var list = self.items
    if (txt.length > 0)
      list = self.items.filter(function(el) {
        if (el.title.toLowerCase().search(new RegExp(txt.toLowerCase())) == -1)
          return false
        else
          return true
      })
    self.trigger('item_list_changed', list)
  })

  // self.on("page",function(page){
  //   self.trigger('page-change', page)
  // })
  self.on('unselect-startup', function(){
    self.trigger('item_detail_changed', null)
  })
  // Add to our item collection.
  // Could push this to a server API.
  self.on('item_detail_add', function(title) {
    var newitem = { id: self.items.length+1, title: title }
    self.items.push(newitem)
    self.trigger('item_list_changed', self.items)
    self.trigger('item_detail_changed', newitem)
  })

  // Pull item for URL route. (id)
  self.on('get-startup-infos', function(id) {
    var item = null
    self.items.forEach(function(el) {
      if (el.id == id) {item = el }
    })
    self.trigger('item_detail_changed', item)
  })

  // Emit event for add item route.
  self.on('route_item_add', function() {
    self.trigger('item_detail_create')
  })

}