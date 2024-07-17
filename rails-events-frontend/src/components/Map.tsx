import type { User } from "../api/User";

interface MapProps {
  user: User | null
}

export default function Map({ user }: MapProps) {
  return <div>Map!</div>
}
