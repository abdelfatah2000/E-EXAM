import React from 'react'
import './modal.css'
import CloseIcon from '@mui/icons-material/Close';
const Modal = ({title, children, toggle, setToggle}) => {
  return (
    <div className='modal-container flex__center' onClick={() => setToggle(false)} style={{ visibility: toggle ? 'visible' : 'hidden', opacity: toggle ? '1' : '0', transition: '.2s ease-in-out' }}>
        <div className="modal-content-large" onClick={(e) => e.stopPropagation()}>
            <div className="flex__between" style={{  }}>
                <h3 className='headings'>{title}</h3>
                <CloseIcon style={{ color: 'var(--first-main-color)', cursor: 'pointer' }} onClick={() => setToggle(false)} />
            </div>
            {children}
        </div>
    </div>
  )
}

export default Modal