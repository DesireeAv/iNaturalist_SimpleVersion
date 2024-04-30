import NiceInput from "../components/NiceInput.jsx"
import { useState } from "react"
import { useParams } from "react-router-dom"

function Upload(){
    const { PID } = useParams()
    const [imgUrl, setImgUrl] = useState("")    
    const [taxon, setTaxon] = useState("")
    const [taken, setTaken] = useState("")
    const [upDate, setUpDate] = useState("")
    const [latitude, setLatitude] = useState("")
    const [longitude, setLongitude] = useState("")
    const [license, setLicense] = useState("")
    const [notes, setNotes] = useState("")
    const [name, setName] = useState("")

    const filler = (e, anyUse) => {
        anyUse(e.target.value)
        console.log(imgUrl)
    }

    const checker = () => {
        if(name != "" && notes != "" && license!= "" && longitude != "" && latitude != "" && upDate != "" && taken != "" && imgUrl != "" && taxon != ""){
            send();
        }
        else{
            alert("Please fill all the information")
        }
    }

    const send = async () => {
        const apiUrl = "http://127.0.0.1:8080/api/upload"
        const postData = {
            takenDate: taken,
            uploadDate: upDate,
            personId: PID,
            latitude: latitude,
            longitude: longitude,
            personName: name,
            taxonName: taxon,
            useLicense: license,
            url: imgUrl,
            note: notes
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
            alert("Upload Succesful")

        }
        catch (error) {
            console.error('Error during POST request:', error);
            throw error; // Re-throw the error to propagate it further
        }
    }

    return(

        <>
        
            <ul className="UploadForm">
                <li>
                    <NiceInput inp={"Image URL"} fun={filler} someUse={setImgUrl} />
                </li>
                <li>
                    <NiceInput inp={"Taxon"} fun={filler} someUse={setTaxon}/>
                </li>
                <li>
                    <NiceInput inp={"Date picture was taken"} fun={filler} someUse={setTaken}/>
                </li>
                <li>
                    <NiceInput inp={"Date of Upload"} fun={filler} someUse={setUpDate}/>
                </li>
                <li>
                    <NiceInput inp={"Latitude"} fun={filler} someUse={setLatitude}/>
                </li>
                <li>
                    <NiceInput inp={"Longitude"} fun={filler} someUse={setLongitude}/>
                </li>
                <li>
                    <NiceInput inp = {"Use License"} fun={filler} someUse={setLicense}/>
                </li>
                <li>
                    <NiceInput inp = {"Observation Notes"} fun={filler} someUse={setNotes}/>
                </li>
                <li>
                    <NiceInput inp = {"Image Owner Name"} fun={filler} someUse = {setName} />
                </li>
                <li className="UpButt">
                    <button onClick={checker}>Upload!</button>
                </li>
            </ul>
        </>
    )
}

export default Upload
