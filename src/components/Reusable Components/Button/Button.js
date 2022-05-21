import React, {useState} from 'react'
import './Button.css'
import KeyboardArrowDownIcon from '@mui/icons-material/KeyboardArrowDown';
import Dropdown from '../Dropdown/Dropdown';

const Button = ({color, size, onClick, variant, children, dropdown, list, ml}) => {
    const [dropMenu, setDropMenu] = useState(false);

    const SIZES = [
        'large',
        'medium'
    ]

    const COLORS = [
        'primary',
        'secondary',
    ]

    const VARIANTS = [
        'filled',
        'outlined'
    ]

    const btnSize = SIZES.includes(size) ? size : SIZES[1];
    const btnColor = COLORS.includes(color) ? color : COLORS[0];
    const btnVariant = VARIANTS.includes(variant) ? variant : VARIANTS[0];
    const marginLeft = ml ? 'ml-26' : ''

  return (
    <button onClick={dropdown ? () => setDropMenu(!dropMenu) : onClick} className={`${btnSize} ${btnVariant}-${btnColor} ${marginLeft} `}>
        {dropdown ? 
        <>
        <div className='flex-align-center'>
            {children} <KeyboardArrowDownIcon fontSize="small"/>
        </div> 
        <Dropdown list={list} toggle={dropMenu}></Dropdown>
        </>
            : `${children}`}
    </button>
  )
}

export default Button