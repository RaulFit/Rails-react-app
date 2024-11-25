import { useEffect, useState } from "react";

type User = {
    id: number,
    name: string,
    email: string,
  }

export default function Root() {
    const [users, setUsers] = useState<User[]>([])

  useEffect(() => {
    fetch("http://localhost:3000/users")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((data) => setUsers(data))
      .catch((error) => console.error("Error fetching users:", error));
  }, []);

  return (
    <div>
      <h1>Users List</h1>
      <ul>
        {users.map((user) => (
          <li key={user.id}>{user.name}<br></br></li>
        ))}
      </ul>
    </div>
  );
  }
