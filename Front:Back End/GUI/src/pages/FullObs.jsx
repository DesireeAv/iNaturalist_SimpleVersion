import { useState, useEffect } from "react"
import { useParams } from "react-router-dom"
import Loader from "../components/Loader.jsx"


function FullObs(){

    const { img_id, PID } = useParams();
    const [taxon, setTaxon] = useState(null);
    const [idents, setIdents] = useState([]);
    const [loading, setLoading] = useState(true)
    const [ob, setOb] = useState(0)
    const [ownerId, setOwnerId] = useState(0)
    let obsId = 0

    useEffect(() => {
        const apiUrl = `http://127.0.0.1:8080/api/obs/${img_id}`
        const fetchData = async () => {
            try{
                const result = await fetch(apiUrl)
                if(!result.ok){
                    throw new Error("Response was not okay")
                }
                const dt = await result.json()
                setTaxon(dt[0]);
                obsId = dt[0].OBSERVATION_ID
                setOwnerId(dt[0].PERSON_ID)
                setOb(dt[0].OBSERVATION_ID)
                console.log(dt[0]);
                console.log(obsId, "me cago")
            }
            catch(error){
                console.log(error)
            }
            
        }
        const fetchId = async () => {

            const secondApi = `http://127.0.0.1:8080/api/identifications/${obsId}`
            try{
                const result = await fetch(secondApi)
                if(!result.ok){
                    throw new Error("Response was not okay")
                }
                const dt = await result.json()
                setIdents(dt)
                console.log(dt, "WTFFFF")
                
            }
            catch(error){
                console.log(error)
            }
        }

        const callback = async () => {
            await fetchData()
            await fetchId()
            console.log(ownerId, "owner")
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
    console.log(PID, "person id viewer")

    const send = async () => {
        const apiUrl = "http://127.0.0.1:8080/api/delObs"
        const postData = {
            img: img_id,
            po: 3
        }
        const req = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(postData)
        }

        try{
            const response = await fetch(apiUrl, req)
            if(!response.ok){
                throw new Error("Response was not okay")
            }
            const responseData = await response.json();
            console.log('POST request successful:', responseData);
            alert("Deletion Succesful")

        }
        catch (error) {
            console.error('Error during POST request:', error);
            throw error; // Re-throw the error to propagate it further
        }
    }


    const delInf = async (infId) => {
        const bapiUrl = "http://127.0.0.1:8080/api/delInf"
        console.log(infId, "this is the inf id")
        const postData = {
            info: infId
        }
        const req = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(postData)
        }

        try{
            const response = await fetch(bapiUrl, req)
            if(!response.ok){
                throw new Error("Response was not okay")
            }
            const responseData = await response.json();
            console.log('POST request successful:', responseData);
            alert("Deletion Succesful")

        }
        catch (error) {
            console.error('Error during POST request:', error);
            throw error; // Re-throw the error to propagate it further
        }
    }


    const infos = idents.map((ids) => {
        console.log(ids.IDENTIFICATION_ID, "ID ID")
        return(

        
            <li className="InfList">
                <p>{ids.QUALITY_LEVEL} &nbsp; {ids.PERSON_NAME} &nbsp; {ids.IDENTIFICATION_DATE}</p>
                {PID == ids.PERSON_ID ? (
                    <button onClick={() => delInf(ids.IDENTIFICATION_ID)}>Delete</button>

                ): (
                    <>
                    </>
                )}
        </li>
    )})

    const goToForm = () => {
        const stupid = obsId
        window.location.href = `/infMaker/${PID}/${ob}`
    }


    return(
        <>
            <div className="contata">
                <p className="TaxTitle">{taxon.TAXON_NAME}</p>
                {PID == ownerId ? (
                    <button onClick={send}>Delete</button>
                ): (
                    <></> 
                )}
            </div>
            <div className="annoyed">
                <div className="TaxCont">
                    <div className="TaxImgCont">
                        <img src={taxon.FIGURE_URL} />
                    </div>
                    <div className="BS">
                        <div className="authData">
                            <p>Author: {taxon.PERSON_NAME} {taxon.PERSON_LAST_NAME}</p>
                        </div>
                        <div className="TaxDataCont">
                            <p className="TaxDTitle">Taxon Data</p>
                            <ul>
                                <li>
                                    <p>Observation ID: &nbsp; {taxon.OBSERVATION_ID}</p>
                                </li>
                                <li>
                                    <p>Latitude: &nbsp; {taxon.GC_LATITUDE}</p>
                                </li>
                                <li>
                                    <p>Longitude: &nbsp; {taxon.GC_LONGITUDE}</p>
                                </li>
                                <li>
                                    <p>Observed: &nbsp; {taxon.IMAGE_DATE}</p>
                                </li>
                                <li>
                                    <p>Upload Date: &nbsp; {taxon.TAKEN_IMAGE_DATE}</p>
                                </li>
                                <li>
                                    <p>Image owner: &nbsp; {taxon.IMAGE_OWNER_NAME}</p>
                                </li>
                                <li>
                                    <p>Use License: &nbsp; {taxon.USE_LICENSE}</p>
                                </li>
                                <li>
                                    <p>Author Note: &nbsp; {taxon.OBSERVATION_NOTE}</p>
                                </li>
                                <li>
                                    <p>Full Taxonomy: &nbsp; {taxon.COMPLETE_TAXONOMY}</p>
                                </li>
                            </ul> 
                        </div>
                    </div>
                </div>
            </div> 
            <div className="uplButt" onClick={goToForm}>
                <button>Make Review</button>
            </div> 
            <ul>
                {infos}
            </ul>
            
        </>
    )
}

export default FullObs
