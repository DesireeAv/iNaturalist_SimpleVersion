import { Routes, Route } from "react-router-dom"
import NavBar from "./components/NavBar.jsx"
import LogIn from "./pages/LogIn.jsx"
import Observations from "./pages/Observations.jsx"
import FullObs from "./pages/FullObs.jsx"
import Upload from "./pages/Upload.jsx"
import InfMaker from "./pages/InfMaker.jsx"
function App() {

    return (
        <> 
            <NavBar />
            <Routes>
                <Route path="/login" element={<LogIn />} />
                <Route path="observations/:PID/" element={<Observations />} />
                <Route path="observations/obs/:img_id/:PID" element={<FullObs />} />
                <Route path="observations/upload/:PID/" element={<Upload />} />
                <Route path="/infMaker/:PID/:obsid" element={<InfMaker />} />
            </Routes>
        </>
    )
}

export default App
