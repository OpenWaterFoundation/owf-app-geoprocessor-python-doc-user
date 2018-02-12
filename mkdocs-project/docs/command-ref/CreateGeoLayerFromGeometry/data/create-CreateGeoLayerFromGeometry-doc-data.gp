# Create user doc data for CreateGeoLayerFromGeometry command
#
# Create the bounding box for Dallas with the WGS84 projection
CreateGeoLayerFromGeometry(NewGeoLayerID = "dallas_bounds_wgs84", GeometryFormat = "BoundingBox", GeometryData = "-97.8,32.35,-96.25,33.32", CRS="EPSG:4326")
# Create the bounding box for Dallas with the NAD83 Zone 14N projection
CreateGeoLayerFromGeometry(NewGeoLayerID = "dallas_bounds_nad83", GeometryFormat = "BoundingBox", GeometryData = "611903,3580541,757772,3688789", CRS="EPSG:26914")
# Write the bounding box for Dallas GeoLayer (WGS84) to GeoJSON
WriteGeoLayerToGeoJSON(GeoLayerID = "dallas_bounds_wgs84", OutputFile = "boundingbox-dallas-wgs84")
# Write the bounding box for Dallas GeoLayer (NAD83) to GeoJSON
WriteGeoLayerToGeoJSON(GeoLayerID = "dallas_bounds_nad83", OutputFile = "boundingbox-dallas-utm-Z14n")