import './App.css';
import { useState } from 'react';
import axios from 'axios';

export default function App() {
  const [array, setArray] = useState([]);
  const [search, setSearch] = useState("");

  const click = () => {
    axios
      .get("http://api.themoviedb.org/3/search/movie?api_key=f33cd318f5135dba306176c13104506a&query=" + search)
      .then((response) => {
        setArray(response.data.result)
      })
  }

console.log(search);
  return (
    <>
      <>
        <input type="text" value={search} onChange={ (event) => { setSearch(event.target.value)} } />
        <button onClick={click}>Search</button>
      </>
      <>
        array.map((film) =>  (
        {/* nom du film trouvé */}
        {film.title}
        <br />
        {/* nom de l'image précédée du chemin pour afficher la jaquette */}
        <img src={"https://image.tmdb.org/t/p/w185" + film.poster_path} />
        );
      </>
    </>
  )
} 