import React, {useEffect, useState} from 'react'
import TopLeft from '../assets/svg/top-left.svg'
import BottomLeft from '../assets/svg/bottom-left.svg'
import BottomRight from '../assets/svg/bottom-right.svg'
import TopRight from '../assets/svg/top-right.svg'
import Button from '../components/Reusable Components/Button/Button'
import axiosInstance from '../axios';
import { useNavigate } from "react-router-dom";
import Cookies from 'js-cookie'

const Login = () => {
    const [loginDetails, setLoginDetails] = useState();
    const history = useNavigate();
    const handleLogin = () => {
        axiosInstance.post('/auth/jwt/create', loginDetails)
        .then((res) => {
            Cookies.set("access_token", res.data.access);
            Cookies.set("refresh_token", res.data.refresh);
            axiosInstance.defaults.headers["Authorization"] =
            "JWT " + Cookies.get("access_token");
            history("/app");
        })
    }
    useEffect(()=> {
        if(Cookies.get('access_token')){
            history('/app/exams/add-exam')
        }
    }, [history])
  return (
    <div className='flex__center' style={{ height: '100vh' }}>
        <img src={TopLeft} alt="topleft" style={{ position: 'absolute', top: 0, left: 0 }}/>
        <img src={BottomLeft} alt="bottomleft" style={{ position: 'absolute', bottom: 0, left: 0 }}/>
        <img src={BottomRight} alt="bottomright" style={{ position: 'absolute', bottom: 0, right: 0 }}/>
        <img src={TopRight} alt="topright" style={{ position: 'absolute', top: 0, right: 0 }}/>
        <div className='flex__column flex-align-center'>
            <span style={{fontSize:"36px", color: 'var(--first-main-color)', fontWeight: 'bold'}}>E-EXAM</span>
            <h1 className='mt-26' style={{ fontSize: '48px' }}>Hello Professor</h1>
            <input onChange={(e) => setLoginDetails({...loginDetails, email: e.target.value})} type="text" placeholder="Email ..." className='mt-26' id="input" style={{ width: 420, height: 55 }} />
            <input onChange={(e) => setLoginDetails({...loginDetails, password: e.target.value})} type="password" placeholder="Password ..." className='mt-26 mb-26' id="input" style={{ width: 420, height: 55 }} />
            <Button onClick={handleLogin} size="large">LOGIN</Button>
        </div>
    </div>
  )
}

export default Login