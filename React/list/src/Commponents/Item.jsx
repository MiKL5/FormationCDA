export default function Item(props) {
    return (
        <li className="border d-flex justify-content-between align-items-center p-2 m-2">
            <div className="p-3">{props.txt}</div>
            <bouton className="btn btn-outline-danger p-2 h-50" onClick={ () => props.delFunc(props.id) }>Supprimer</bouton>
        </li>
    )
}