import React from 'react'

const TextArea = ({onChange, value, label}) => {
  return (
    <div className="flex-align-center mt-26">
        <label className="mr-26 mb-4" for="input">{label}</label>
        <textarea style={{ width: 'auto', height: 'auto' }} cols="79" id="input"></textarea>
    </div>
  )
}

export default TextArea