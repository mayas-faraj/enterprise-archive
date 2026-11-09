using System;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Maps.MapControl.WPF;

namespace NewsTv.Codes
{
    internal class Interface
    {
        //public constructors region
        public Interface(Map map, Profile profile)
        {
            this.map = map;
            this.profile = profile;

            if (profile != null)
            {
                this.map.Center = new Location(profile.InitialLatitude, profile.InitialLongitude);
                this.map.ZoomLevel = profile.InitialZoom;
                this.map.Heading = profile.InitialHeading;
                
                switch (profile.Mode)
                {
                    case MapMode.AerialMode:
                        this.map.Mode = new AerialMode(false);
                        break;
                    case MapMode.AerialModeWidthLabel:
                        this.map.Mode = new AerialMode(true);
                        break;
                    case MapMode.MercatorMode:
                        this.map.Mode = new MercatorMode();
                        break;
                    case MapMode.RoadMode:
                        this.map.Mode = new RoadMode();
                        break;
                }

                if (profile.ScaleVisibility)
                    this.map.ScaleVisibility = Visibility.Visible;
                else
                    this.map.ScaleVisibility = Visibility.Collapsed;

                if (profile.Panels != null)
                    foreach (Panel panel in profile.Panels)
                        AddPanel(panel);

                if (profile.MapPolygons != null)
                    foreach (MapPolygon polygon in profile.MapPolygons)
                        AddPolygon(polygon);

                if (profile.MapLabels != null)
                    foreach (MapLabel label in profile.MapLabels)
                        AddLabel(label);
            }
        }

        //public properties region
        public Map Map
        {
            get
            {
                return map;
            }
            set
            {
                map = value;
            }
        }

        //public functions region
        public void AddLabel(MapLabel mapLable)
        {
                if (mapLable != null)
                {
                    //add layer if there is no layer
                    MapLayer layer = getMapLayer();

                    if (layer != null)
                    {
                        //define the latitude and longitude for the element
                        //Point current = map.LocationToViewportPoint(new Location(mapLable.Latitude, mapLable.Longitude));
                        //Point point = new Point();

                        //calculate and add the point to the layer
                        if (Settings.LabelsWidthCircle)
                        {   
                            //point.X = current.X - mapLable.PointRadius;
                            //point.Y = current.Y - mapLable.PointRadius;
                            layer.AddChild(mapLable.ToPoint(), new Location(mapLable.Latitude, mapLable.Longitude), PositionOrigin.Center);
                        }

                        //calculate and add the textblock to the layer
                        //point.X = current.X + Settings.LabelsToCircleXShift + mapLable.PointRadius;
                        //point.Y = current.Y + Settings.LabelsToCircleYShift - mapLable.PointRadius;
                        layer.AddChild(mapLable.ToText(), new Location(mapLable.Latitude, mapLable.Longitude), new Point(Settings.LabelsToCircleXShift, Settings.LabelsToCircleYShift));
                    }
                }
        }

        public void AddPolygon(MapPolygon mapPolygon)
        {
            if (mapPolygon != null)
            {
                map.Children.Add(mapPolygon);
            }
        }

        public void AddImage(MapImage mapImage)
        {
            if (mapImage != null)
            {
                //add layer if there is no layer
                MapLayer layer = getMapLayer();

                if (layer != null)
                    layer.AddChild(mapImage.ToImage(), new Location(mapImage.Latitude, mapImage.Longitude), PositionOrigin.Center);
            }
        }

        public void AddContent(MapContent content)
        {
            if (content != null)
            {
                //add layer if there is no layer
                MapLayer layer = getMapLayer();

                if (layer != null)
                    layer.AddChild(content.ToSackPanel(), new Location(content.Latitude, content.Longitude), PositionOrigin.Center);
            }

        }

        public void AddPanel(Panel panel)
        {
            if (map.Parent != null && map.Parent.GetType() == typeof(Grid))
                ((Grid)map.Parent).Children.Add(panel.ToToolBar());
        }

        //private functions region
        private MapLayer getMapLayer()
        {
            if (map.Children.Count == 0)
                map.Children.Add(new MapLayer());

            MapLayer layer = map.Children[0] as MapLayer;

            return layer;
        }

        //private fields region
        private Map map;
        private Profile profile;

    }
}
