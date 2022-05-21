import React from 'react'
import InputField from '../Input Field/InputField'

function TimeInterval({from, to, setFrom, setTo, label}) {
  return (
    <div className='flex__column'>
        { label && <label className="mb-4">Time Interval</label>}
        <div className="flex-align-center">
            <InputField value={from} onchange={setFrom} type="datetime-local" />&nbsp; To &nbsp;<InputField value={to} onchange={setTo} type="datetime-local" />
        </div>
    </div>
  )
}

export default TimeInterval