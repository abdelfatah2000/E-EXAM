import React, { useState } from 'react'
import InputField from '../Input Field/InputField'
import './dropdown.css';
import IconButton from '../Icon Button/IconButton';
import AddIcon from '@mui/icons-material/Add';

const Dropdown = ({toggle, list, onSelect, withInput, inputLabel, setList, w50}) => {
  const [addedItem, setAddedItem] = useState('');

  const addItem = () => {
    setList([...list, addedItem])
  }
  return (
    <ul className={`menuList flex__start flex__column ${toggle ? 'animeDown' : 'animeUp'}`} style={{ position: 'absolute', visibility: toggle ? 'visible' : 'hidden', opacity: toggle ? '1' : '0', transition: '1s', width: w50 ? '150px' : '' }}>
        {
          withInput && 
          <li className="flex-align-center">
            <input id="input" style={{ width: 150 }} className="mr-8" onChange={(e) => setAddedItem(e.target.value)} value={addedItem} type='text' placeholder={inputLabel} />
            <IconButton onclick={addItem} variant="circled" size="medium" color="secondary" icon={<AddIcon fontSize="small" />} />
          </li>
        }
        {list.map((l) => (
          <li data-selected={l.text} data-id={l.id} onClick={onSelect}>{l.text}</li>
        ))}

    </ul>
  )
}

export default Dropdown