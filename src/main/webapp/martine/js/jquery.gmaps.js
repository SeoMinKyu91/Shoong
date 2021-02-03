(function($) {
  'use strict';
  var Gmaps = window.Gmaps || {};
  Gmaps = (function() {
    function Gmaps(element, settings, index) {
      var _ = this;
      _.element = element;
      _.settings = settings;
      _.$canvas = null;
      _.$map = $(element);
      _.index = index;
      _.id = 'jquery-gmaps-' + index;
      _._init(_.element);
    }
    return Gmaps;
  }());
  Gmaps.prototype._init = function(element) {
    var _ = this;
    _.getMapSettings();
    _._canvas(element);
    _._scripts();
  }
  Gmaps.prototype._canvas = function(element) {
    var _ = this;
    if (_.$map.find('.googlemap-overview').length > 0) {
      _.$map.find('.googlemap-overview').remove();
    }
    var _googlemap = document.createElement('div');
    $(_googlemap).addClass('googlemap-overview');
    $(_googlemap).addClass(_.id);
    $(element).prepend($(_googlemap));
    return _.$canvas = $(_googlemap);
  };
  Gmaps.prototype._scripts = function() {
    var gmap = this;
    if ($('#gmaps-api').length === 0) {
      var _api = "https://maps.googleapis.com/maps/api/js";
      if (gmap.key) {
        _api += '?key=' + gmap.key;
      } else {
        return false;
      }
      var api = document.createElement('script');
      api.type = 'text/javascript';
      api.src = _api;
      api.id = 'gmaps-api';
      api.async = true;
      api.defer = true;
      document.body.appendChild(api);
      if (gmap.clustering) {
        var _clustering = "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js";
        var clustering = document.createElement('script');
        clustering.type = 'text/javascript';
        clustering.src = _clustering;
        clustering.id = 'gmaps-clustering';
        clustering.async = true;
        clustering.defer = true;
        document.body.appendChild(clustering);
      }
    }
    var loading = setInterval(function() {
      if (window.google !== undefined) {
        window.clearInterval(loading);
        gmap.mapInit();
      }
    }, 200);
  };
  Gmaps.prototype.getMapSettings = function() {
    var _ = this;
    _.map = null;
    _.markers = [];
    _.bounds = null;
    _.infowindows = [];
    _.key = _.getMapKey(_.element);
    _.zoom = _.getMapZoom(_.element);
    _.clustering = _.getMapClustering(_.element);
    _.lang = _.getMapLanguage();
    _.style = _.getMapStyle(_.settings);
    _.controlZoom = _.getMapControlZoom(_.element);
    _.controlType = _.getMapControlType(_.element);
    _.controlScale = _.getMapControlScale(_.element);
    _.controlStreetView = _.getMapControlStreetView(_.element);
    _.controlRotate = _.getMapControlRotate(_.element);
    _.controlFullscreen = _.getMapControlFullscreen(_.element);
    _.eventDraggable = _.getMapEventDraggable(_.element);
    _.eventDoubleClickZoom = _.getMapEventDoubleClickZoom(_.element);
    _.eventMouseWheel = _.getMapEventMouseWheel(_.element);
    _.locations = _.getLocations(_.element);
  };
  Gmaps.prototype.getMapLanguage = function() {
    var $html = $('html');
    var _setting = $html.attr('lang');
    if (_setting === undefined || _setting === "") {
      _setting = "en";
    }
    return _setting;
  };
  Gmaps.prototype.getMapKey = function(element) {
    var _attr = $(element).attr('data-key');
    return _attr;
  };
  Gmaps.prototype.getMapZoom = function(element) {
    var _attr = $(element).attr('data-zoom');
    if (typeof _attr !== typeof "undefined") {
      _attr = 4;
    } else {
      _attr = parseInt(_attr);
    }
    return _attr;
  };
  Gmaps.prototype.getMapClustering = function(element) {
    var _setting = Boolean($(element).attr('data-clustering'))
    if (_setting === undefined) {
      _setting = false;
    }
    return _setting;
  };
  Gmaps.prototype.getMapControlZoom = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-control-zoom');
    return _.___getBoolean(_attr, false);
  };
  Gmaps.prototype.getMapControlType = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-control-type');
    return _.___getBoolean(_attr, false);
  };
  Gmaps.prototype.getMapControlScale = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-control-scale');
    return _.___getBoolean(_attr, false);
  };
  Gmaps.prototype.getMapControlStreetView = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-control-streetview');
    return _.___getBoolean(_attr, false);
  };
  Gmaps.prototype.getMapControlRotate = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-control-rotate');
    return _.___getBoolean(_attr, false);
  };
  Gmaps.prototype.getMapControlFullscreen = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-control-fullscreen');
    return _.___getBoolean(_attr, false);
  };
  Gmaps.prototype.getMapEventDraggable = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-event-draggable');
    return _.___getBoolean(_attr, true);
  };
  Gmaps.prototype.getMapEventDoubleClickZoom = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-event-doubleclick');
    var _return = _.___getBoolean(_attr, true);
    if (_return === false) {
      _return = true;
    } else {
      _return = false;
    }
    return _return;
  };
  Gmaps.prototype.getMapEventMouseWheel = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-event-mousewheel');
    return _.___getBoolean(_attr, false);
  };
  Gmaps.prototype.getMapStyle = function(settings) {
    try {
      return settings.style;
    } catch (err) {
      return false;
    }
  };
  Gmaps.prototype.getLocations = function(element) {
    var _ = this;
    var $locations = $(element).find('.marker');
    var locations = [];
    $locations.each(function(i, marker) {
      var marker = {
        'id': _.getMarkerID(marker),
        'lat': $(marker).attr('data-lat'),
        'lng': $(marker).attr('data-lng'),
        'html': $(marker).html(),
        'icon': _.getMarkerIcon(marker),
        'draggable': _.getMarkerEventDraggable(marker),
      };
      locations.push(marker);
    });
    return locations;
  };
  Gmaps.prototype.mapInit = function() {
    var _ = this;
    var _opts = {};
    _opts.zoom = _.zoom;
    _opts.zoomControl = _.controlZoom;
    _opts.mapTypeControl = _.controlType;
    _opts.scaleControl = _.controlScale;
    _opts.streetViewControl = _.controlStreetView;
    _opts.rotateControl = _.controlRotate;
    _opts.fullscreenControl = _.controlFullscreen;
    _opts.draggable = _.eventDraggable;
    _opts.disableDoubleClickZoom = _.eventDoubleClickZoom;
    _opts.scrollwheel = _.eventMouseWheel;
    _.$map.addClass('googlemap')
      .addClass('googlemap-load');
    if (_.style !== false) {
      _opts.styles = _.style;
    }
    _.map = new google.maps.Map(_.$canvas.get(0), _opts);
    $.each(_.locations, function(index, value) {
      _.addMarker(value);
    });
    _.$map.trigger('onLoad');
    _.setCenter();
    if (_.clustering) {
      var markerCluster = new MarkerClusterer(_.map, _.markers, {
        imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
      });
    }
  };
  Gmaps.prototype.getMarkerID = function(element) {
    var _ = this;
    var _attr = $(element).attr('data-id');
    if (_attr === undefined) {
      _attr = _.___randomId(10);
    } else {
      _attr = _.___slugify(_attr);
    }
    return _attr;
  }
  Gmaps.prototype.getMarkerIcon = function(element) {
    var _image = $(element).attr('data-marker-image');
    var _width = parseInt($(element).attr('data-marker-width'));
    var _height = parseInt($(element).attr('data-marker-height'));
    if (_image === undefined || !$.isNumeric(_width) || !$.isNumeric(_height)) {
      return false;
    }
    var icon = {
      url: _image,
      width: _width,
      height: _height
    };
    return icon;
  };
  Gmaps.prototype.getMarkerEventDraggable = function(element) {
    var _setting = Boolean($(element).attr('data-draggable'));
    if (_setting === undefined || _setting === "") {
      _setting = false;
    }
    return _setting;
  };
  Gmaps.prototype.getMarkerEventClickeable = function(element) {
    var _setting = Boolean($(element).attr('data-clickeable'));
    if (_setting === undefined || _setting === "") {
      _setting = false;
    }
    return _setting;
  };
  Gmaps.prototype.addMarker = function(settings) {
    var gmap = this;
    var options = {};
    options.id = settings.id
    options.position = new google.maps.LatLng(settings.lat, settings.lng);
    options.map = gmap.map;
    options.clickable = true;
    options.animation = google.maps.Animation.DROP;
    if (settings.icon !== false) {
      options.icon = settings.icon;
      var icon = {
        url: settings.icon.url,
        size: new google.maps.Size(settings.icon.width, settings.icon.height)
      };
    }
    if (settings.draggable !== false) {
      options.draggable = true;
    }
    var marker = new google.maps.Marker(options);
    gmap.markers.push(marker);
    var infowindow = new google.maps.InfoWindow({
      content: settings.html
    });
    gmap.infowindows.push(infowindow);
    marker.addListener('click', function() {
      $.each(gmap.infowindows, function(index, object) {
        object.close();
      });
      infowindow.open(gmap.map, marker);
      gmap.map.setCenter(this.getPosition());
      var _position = {};
      _position.lat = parseFloat(marker.getPosition().lat());
      _position.lng = parseFloat(marker.getPosition().lng());
      gmap.$map.trigger('onMarkerClick', [_position, settings.id]);
    });
    gmap.map.setCenter(options.position);
  }
  Gmaps.prototype.openMarker = function(id) {
    var _ = this;
    $.each(_.markers, function(index, marker) {
      if (marker.id === id) {
        new google.maps.event.trigger(marker, 'click');
      }
    });
  };
  Gmaps.prototype.setCenter = function() {
    var gmap = this;
    var bounds = new google.maps.LatLngBounds();
    $.each(gmap.locations, function(index, value) {
      var latlng = new google.maps.LatLng(value.lat, value.lng);
      bounds.extend(latlng);
    });
    if (gmap.locations.length === 1) {
      gmap.map.setCenter(bounds.getCenter());
    } else {
      gmap.map.fitBounds(bounds);
    }
  }
  Gmaps.prototype.reload = function() {
    var _ = this;
    _._init(_.element);
  };
  Gmaps.prototype.destroy = function() {
  };
  Gmaps.prototype.___getBoolean = function(_value, _default) {
    var _ret = _default;
    if (_value === "true") {
      _ret = true;
    } else if (_value === "false") {
      _ret = false;
    }
    return _ret;
  };
  Gmaps.prototype.___slugify = function(_string) {
    return _string.toString()
      .toLowerCase()
      .replace(/\s+/g, '-')
      .replace(/[^\w\-]+/g, '')
      .replace(/\-\-+/g, '-')
      .replace(/^-+/, '')
      .replace(/-+$/, '');
  };
  Gmaps.prototype.___randomId = function(lenght) {
    var charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var _return = '';
    for (var i = 0; i < lenght; i++) {
      var _rnd = Math.floor(Math.random() * charset.length);
      _return += charset.substring(_rnd, _rnd + 1);
    }
    return _return.toLowerCase();
  };
  $.fn.gmaps = function() {
    var _gmaps = this;
    var _opt = arguments[0];
    var _args = Array.prototype.slice.call(arguments, 1);
    var _length = _gmaps.length;
    var i;
    var _return;
    for (i = 0; i < _length; i++) {
      if (typeof _opt == 'object' || typeof _opt == 'undefined')
        _gmaps[i].gmap = new Gmaps(_gmaps[i], _opt, i);
      else
        _return = _gmaps[i].gmap[_opt].apply(_gmaps[i].gmap, _args);
      if (typeof _return != 'undefined') return _return;
    }
    return _gmaps;
  };
}(jQuery));