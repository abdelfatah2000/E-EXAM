import React from 'react'
import './checkbox.css'
const Checkbox = ({label, checked, resultID, onChange}) => {
  return (
    <div className='flex'>
    <input id={resultID} onChange={onChange} checked={checked} type="checkbox" className='checkbox flex__center' />
    <label className='ml-9' >{label}</label>
    </div>
  )
}

export default Checkbox