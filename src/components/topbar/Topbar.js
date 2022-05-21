import React, {useState} from 'react'
import Button from '../Reusable Components/Button/Button'
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import SearchField from '../Reusable Components/Search Field/SearchField'
import './topbar.css'
import { useDispatch, useSelector } from "react-redux";
import { level } from '../../actions/index'
import Dropdown from '../Reusable Components/Dropdown/Dropdown';
import {useNavigate} from 'react-router-dom'
import axiosInstance from '../../axios';
import Cookies from 'js-cookie'

function Topbar() {
  const [dropdownImg, setDropdownImg] = useState(false);

  const level = useSelector((state) => state.level);
  const dispatch = useDispatch()
  const history = useNavigate();
  const list = [
    'Secondary One',
    'Secondary Two',
    'Secondary Three'
  ]

  const imgList = [
    'Logout'
  ]

  const logout = () => {
    axiosInstance.post('users/logout/blacklist/', {
      refresh_token: Cookies.get('refresh_token'),
  });
  Cookies.remove('access_token');
  Cookies.remove('refresh_token');
  axiosInstance.defaults.headers['Authorization'] = null;
  history('/login');
  }

  const selectLevel = (e) => {
    dispatch(level(e.target.datalist.id))
  }
  return (
    <div className='topbar__container'>
      <Button onSelect={selectLevel} list={list} color="primary" size="large" variant="filled" dropdown>
        Secondary One
      </Button>
      <div className='flex'>
      <SearchField />
      <div style={{ position: 'relative', cursor: 'pointer' }}>
        <div onClick={() => setDropdownImg(!dropdownImg)} className='teacher__image flex-align-center ml-26'>
          <img alt="Proffessor" src="/test.jpg" className='mr-5' />
          <KeyboardArrowDownIcon fontSize="small"/>
        </div>
        <Dropdown onSelect={logout} w50={true} toggle={dropdownImg} list={imgList} />
      </div>
      </div>
    </div>
  )
}

export default Topbar