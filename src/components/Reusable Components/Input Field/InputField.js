import React, { useState } from 'react'
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import './inputField.css'
import Dropdown from '../Dropdown/Dropdown';

function InputField({type, placeholder, label, mr7, value, onchange, column, dropdown, list, setList, autoWidth, withInput, keypress}) {
  const [dropmenu, setDropmenu] = useState(false)
  const toggleDropdown = () => {
    setDropmenu(!dropmenu)
  }
  return (
    <div className={`${column ? 'flex__column' : 'flex-align-center'} ${mr7? 'mr-7' : ''}`}>
        {
          label && <label className="mr-26 mb-4" for="input">{label} {!column && ':'} </label>
        } 
        {
          dropdown ? 
          <div style={{ cursor: 'pointer', position: 'relative' }}>
            <div onClick={toggleDropdown}  id='input' className="flex__between flex-align-center">
              <p>{value ? value : placeholder}</p>
              <KeyboardArrowDownIcon fontSize="small" style={{ color: 'var(--second-main-color)' }} />
            </div>
            <Dropdown withInput={withInput} toggle={dropmenu} list={list} setList={setList} onSelect={(e) => {
              onchange(e);
              setDropmenu(false)
            }}/>
          </div>
            :
        
        <input onKeyUp={(e) => {
          if(e.key === 'Enter'){
            keypress()
          }
        }} style={{ width: autoWidth ? '79%' : '' }} id="input" type={type} onChange={onchange} value={value} placeholder={placeholder} />
        }
    </div>
  )
}

export default InputField