import React from 'react'
import './radiobutton.css'
import CloseIcon from '@mui/icons-material/Close';

const RadioButton = ({label, id, list, setList}) => {
  return (
    <div className="mr-7 mb-4" style={{ position: 'relative' }}>
        <input type="radio" id={id} name="radioFruit"></input>
        <label for={id}>{label}</label>
        <div className="deleteHover flex__center">
            <CloseIcon onClick={() => setList(list.filter(l => l.id !== id))} fontSize='' style={{ color: 'red', cursor: 'pointer' }} />
        </div>
    </div>
  )
}

export default RadioButton