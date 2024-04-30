import NiceInput from "../components/NiceInput.jsx"
import { useState } from "react"
import { useParams } from "react-router-dom"

function InfMaker(){
    const { PID, obsid } = useParams()
    const [rank, setRank] = useState("")
    const [date, setDate] = useState("")
    const filler = (e, anyUse) => {
        anyUse(e.target.value)
    }

    const checker = () => {
        if(date != "" && rank != ""){
            send();
        }
        else{
            alert("Please fill all the information")
        }
    }

    const send = async () => {
        const apiUrl = "http://127.0.0.1:8080/api/mkInf"
        const postData = {
            rank: rank,
            date: date,
            personId: PID,
            obs: obsid, 
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
                    <NiceInput inp={"Rank From one to ten"} fun={filler} someUse={setRank} />
                </li>
                <li>
                    <NiceInput inp={"Upload-Date"} fun={filler} someUse={setDate}/>
                </li>
                <li className="UpButt">
                    <button onClick={checker}>Upload!</button>
                </li>
            </ul>
        </>
    )
}

export default InfMaker 
