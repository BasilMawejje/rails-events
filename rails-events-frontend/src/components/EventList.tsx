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
  
  // // Alternative way to write promises in an easier way using async await
  // const getUsers = async (url: string) => {
  //   const res = await fetch(url);
  //   const data: User[] = await res.json();
  //   setUsers(data);
  // }

  const getUsers = async (url: string) => {
    await fetch(url)
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
