vrs.ux.touch.LeafletDraggable = L.Draggable.extend({
   _insidePopop: function(elm) {
      var class_name;
      while (elm.parentNode) {
         class_name = elm.parentNode.className;
         if (class_name && class_name.indexOf('leaflet-popup') >= 0) {
            return true;
         }
         elm = elm.parentNode;
      }
      return false;
   },

   _onDown: function(evt) {
      if (this._insidePopop(evt.target)) { return; }
      return this.__proto__.__proto__._onDown.apply(this, arguments);
   },
   _onMove: function(evt) {
      if (this._insidePopop(evt.target)) { return; }
      return this.__proto__.__proto__._onMove.apply(this, arguments);
   },
   _onUp: function(evt) {
      if (this._insidePopop(evt.target)) { return; }
      return this.__proto__.__proto__._onUp.apply(this, arguments);
   }
});

vrs.ux.touch._OldLeafletDrag = L.Map.Drag;
vrs.ux.touch.LeafletDrag = L.Map.Drag.extend({
   addHooks: function () {
      if (!this._draggable) {
         // Aside for this line this is directly from Leaflet
         // https://github.com/vrsource/Leaflet/blob/master/src/map/handler/Map.Drag.js
         this._draggable = new vrs.ux.touch.LeafletDraggable(this._map._mapPane, this._map._container);

         this._draggable
            .on('dragstart', this._onDragStart, this)
            .on('drag', this._onDrag, this)
            .on('dragend', this._onDragEnd, this);

         var options = this._map.options;

         if (options.worldCopyJump && !options.continuousWorld) {
            this._draggable.on('predrag', this._onPreDrag, this);
            this._map.on('viewreset', this._onViewReset, this);
         }
      }
      this._draggable.enable();
   }
});
// Use our map drag instead of Leaflets
L.Map.Drag = vrs.ux.touch.LeafletDrag;
