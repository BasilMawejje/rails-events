import Map from "./components/Map";
import Events from "./components/EventList";
import type { User } from "./api/User";
import { useState } from "react";

function App() {
  const [user, setUser] = useState<User | null>(null);
  
  const handlePanEventOnMap = (user: User | null) => {
    setUser(user)
  }
  
 return (
  <div className="h-screen w-screen grid grid-cols-12">
    <div className="col-span-6 p-2">
      <Events onUserClick={handlePanEventOnMap} />
    </div>
    <div className="col-span-6">
      <Map user={user}/>
    </div>
  </div>
 )
}

export default App
