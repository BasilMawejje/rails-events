import { useState, useEffect } from "react";
import type { User } from "../api/User";

interface EventListProps {
  onUserClick: (user: User) => void;
}

export default function EventList({ onUserClick }: EventListProps) {
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
      .then((data: User[]) => {
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
            <li>
              <a className="text-blue-500 hover:text-blue-800" 
                onClick={() => onUserClick(user)} >
                {user.name}
              </a>
            </li>
            <li>{user.address.geo.lat}</li>
            <li>{user.address.geo.lng}</li>
          </ul>
        </div>
      )}
    </div>
  );
}
