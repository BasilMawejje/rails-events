export interface User {
  id: number;
  name: string;
  username: string;
  email: string;
  address: {
    geo: {
      lat: number;
      lng: number;
    }
  }
}
