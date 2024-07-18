import type { User } from "../api/User";
import "leaflet/dist/leaflet.css";
import type { Map as LeafletMap } from "leaflet";
import { useEffect, useRef } from "react";
import { MapContainer, TileLayer, Marker } from "react-leaflet";

interface MapProps {
  user: User | null
}

export default function Map({ user }: MapProps) {
  const mapRef = useRef<LeafletMap | null>(null);
  useEffect(() => {
    if (mapRef.current && user) {
      mapRef.current.flyTo([user.address.geo.lat, user.address.geo.lng])
    }
  }, [user])
  
  return <MapContainer
    ref={mapRef}
    center={[40.7, -74]}
    zoom={12}
    scrollWheelZoom
    className="h-full"
  >
    <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
    {user && <Marker position={[user.address.geo.lat, user.address.geo.lng]}/>}
  </MapContainer>
}
