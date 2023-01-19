import './App.css';
import { useState } from 'react';
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';

export default function App() {
  const [array, setArray] = useState([]);
  const [search, setSearch] = useState("");
  const handleClick = () => {
    axios
      .get("http://api.themoviedb.org/3/search/movie?api_key=f33cd318f5135dba306176c13104506a&query=" + search)
      .then((reponse) => {
        // console.log(reponse.data.results)
        setArray(reponse.data.results)
      })
    // console.log(search);
  }

  return (
    <div className="App container mt-3">
      <div class="input-group input-group-default mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">Titre du film</span>
        <input type="search" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value={search} onChange={(event) => { setSearch(event.target.value) }} />
        <button class="btn btn-success" onClick={handleClick}>Search</button>
      </div>
      <>
        {
          array.map((film) => (
            <>
              {/* nom du film trouvé */}
              {film.title}
              <br />
              {/* nom de l'image précédée du chemin pour afficher la cover */}
              <img src={"https://image.tmdb.org/t/p/w185" + film.poster_path} alt={film.title} title={film.title} />
              <br />
              <hr />
            </>
          ))
        }
      </>
    </div>
  )
} 