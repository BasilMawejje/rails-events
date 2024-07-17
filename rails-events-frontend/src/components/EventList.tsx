import { useState, useEffect } from "react";
import type { User } from "../api/User";

export default function EventList() {
  const [users, setUsers] = useState<User[]>([]);

  useEffect(() => {
    const url: string = "https://jsonplaceholder.typicode.com/users";
    getUsers(url)
  }, [])

  const getUsers = (url: string) => {
    fetch(url)
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        setUsers(data);
      })
      .catch((error) => console.log(error));
  }
  
  return (
    <div>
      <h1>What's happening? What's up?</h1>
      {users.map( user => 
        <div key={user.id}>
          <ul>
            <li>{user.name}</li>
            <li>{user.address.geo.lat}</li>
            <li>{user.address.geo.lng}</li>
          </ul>
        </div>
      )}
    </div>
  );
}
