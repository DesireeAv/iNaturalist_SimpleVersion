import ObsCard from "./ObsCard.jsx"

function ObsWidget(props){


    const handler = () => {
        props.clicker(props.refer.id)
    }
    return(
        <>
            <button className="widget" onClick={handler}>
                <img src={props.refer.url} />
                <footer>{props.refer.tax_name} &nbsp; {props.refer.date} &nbsp; {props.refer.name}</footer>
            </button>
        </>
    )

}

export default ObsWidget
