import { useState } from "react";

export default function App() {
  // initialiser le state
  const [ counter, setCounter] = useState(0);
  // ajouter l au state à chaque click
  const countClick = () => {
    setCounter(counter +1);
  }
  return (
    <>
    <h1>{counter}</h1>
    <button onClick={countClick}>Click me!</button>
    </>
  );
}