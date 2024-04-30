import lp from "../assets/lp.png"
import NiceInput from "../components/NiceInput.jsx"
import { useState } from "react"


function LogIn(){

    const [email, setEmail] = useState("")
    const [lastName, setLastName] = useState("")
    const [name, setName] = useState("")
    const [id, setId] = useState("")

    const filler = (e, anyUse) => {
        anyUse(e.target.value)
    }

    const checker = () => {
        console.log(email, name, lastName, id)
        if(email != "" && name != "" && lastName != "" && id != ""){
            window.location.href = `/observations/${id}`
            return true;
        }
        else{
            alert('Please fill in all required fields.');
        }
    }


    return(
        <>
            <div className="container" >
                <div className="leftlog">
                    <img src={lp} />
                </div>
                <div className="rightlog">
                    <h1>Welcome Back!</h1>
                    <ul>
                        <li>
                            <NiceInput fun={filler} inp={"Email"} someUse = {setEmail} />
                        </li>
                        <li>
                            <NiceInput fun={filler} inp={"Name"} someUse = {setName} />
                        </li>
                        <li>

                            <NiceInput fun={filler} inp={"Last Name"} someUse = {setLastName} />
                        </li>
                        <li>
                            <NiceInput fun={filler} inp={"ID"} someUse = {setId} />
                        </li>
                        <li>
                                <button onClick={checker}>Log In</button>
                        </li>
                    </ul>

                </div>
            </div>
        </>
    )
}

export default LogIn
