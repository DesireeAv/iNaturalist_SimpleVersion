import { useParams } from "react-router-dom" 
import { useState, useEffect } from "react"



function NavBar(){
    const [curr, setCurr] = useState(false)
    const [uid, setUid] = useState(0)


    useEffect(() => {
        setCurr(window.location.href.startsWith("http://localhost:5173/observations"))
        const urlParams = new URLSearchParams(window.location.href)
        setUid(urlParams.get('PID'))
        console.log(uid, "Does this bs work?");
    }, [])

    return(
        <>
            <nav className="NavBar">
                <a className="LogoText" href="/observations">Tec-Naturalist</a>
                <ul>
                    {curr ? (
                        <li>
                        </li>
                    ) : (
                        <li>
                            <a href="/login">Log in</a>
                        </li>
                    )}
                </ul>
            </nav>
        </>
    )
}

export default NavBar
