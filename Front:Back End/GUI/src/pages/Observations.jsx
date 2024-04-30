import { useEffect, useState } from "react"
import ObsCard from "../components/ObsCard.jsx"
import ObsWidget from "../components/ObsWidget.jsx";
import Loader from "../components/Loader.jsx"
import { useParams } from "react-router-dom"


function Observations(){
    const [data, setData] = useState(null)
    const [imgs, setImgs] = useState([])
    const [loading, setLoading] = useState(true)
    const { PID } = useParams()
    const apiUrl = 'http://127.0.0.1:8080/api'
    console.log(PID)
    useEffect(() => {
        const fetchData = async () => {
            try{
                const response = await fetch(apiUrl)
                if(!response.ok){
                    throw new Error("Response was not okay")
                }
                const dt = await response.json()
                setData(dt);
                const imgArray = dt.map(icon => {
                    return new ObsCard(
                        icon.IMAGE_ID,
                        icon.FIGURE_URL, 
                        icon.PERSON_NAME, 
                        icon.PERSON_LAST_NAME, 
                        icon.IMAGE_DATE, 
                        icon.TAKEN_IMAGE_DATE,
                        icon.TAXON_NAME
                    )
                })
                setImgs(imgArray)


            }
            catch(error){
                console.log("connection failed")
            }
        }

        const callback = async () => {
            await fetchData()
            setLoading(false)
        }
        callback()
    }, [])

    if(loading){
        return(
            <>
                <Loader></Loader>
            </>
        )
    }

    const goToObs = (link) => {
        window.location.href = `obs/${link}/${PID}`
    }

    const widgets = imgs.map(struct => {
        return(
            <li>
                <ObsWidget refer={struct} clicker={goToObs}/>
            </li>
        )
    })

    const upl = () => {
        window.location.href = `upload/${PID}`
    }


    return(
        <>
            <div className="dumby" >
                <button className="dumber" onClick={upl} > Upload</button>
                <ul className="ObsList">
                    {widgets}
                </ul>
            </div>
        </>
    )
}
export default Observations
