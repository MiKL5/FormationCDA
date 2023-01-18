
import {useState} from 'react'
import Item from './Item'
import {v4 as uuidv4} from 'uuid'

export default function Form(){
    const [dataArr, setDataArr] = useState([

    ])

    const [stateInput, setStateInput] = useState();

    const deleteElement = id =>{
        console.log(id);
        // filter les élément aprés la suppression en ne gardant que ceux qui ne sont pas supprimés
        const filteredState = dataArr.filter(item => {
            return item.id !== id;
        })
        setDataArr(filteredState)
    }

    // le bouton ajoute l'élément
    const addTodo = e =>{
        e.preventDefault();
        // nv tableau
        const newArr = [...dataArr]
        const newTodo = {};
        newTodo.txt = stateInput;
        newTodo.id = uuidv4();
        newArr.push(newTodo);
        setDataArr(newArr);
    }

    const linkedInput = e => {
        console.log(e);
        setStateInput(e);
    }

    return(
        // Le contenu visuel
        <div className="m-auto px-4 col-12 col-sm-10 col-lg-6">
            <form onSubmit={e => addTodo(e)} className='mb-3'>
                <label htmlFor="todo" className="form-label mt-3">J'ai besoin de ...</label>
                <div className='d-flex'>
                <input 
                value={stateInput}
                onChange ={e => linkedInput(e.target.value) }
                type="text" 
                className="form-control" 
                id="todo" />
                <button className="ms-2 mt-2 btn btn-outline-success d-block">Ajouter</button>
                </div>
            </form>

            <h2>Ma liste</h2>
            <ul className="list-group">
                {dataArr.map((item) => {
                    return( <Item
                        txt={item.txt}
                        key={item.id}
                        id={item.id}
                        delFunc={deleteElement}
                        /> )
                })}
            </ul>
        </div>
    )
}