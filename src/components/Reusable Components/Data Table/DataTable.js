import React, { useState } from 'react'
import Checkbox from '../Checkbox/Checkbox'
import Button from '../Button/Button'
import SearchField from '../Search Field/SearchField'
import './datatable.css';
import IconButton from '../Icon Button/IconButton';
import VisibilityIcon from '@mui/icons-material/Visibility';
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import DeleteIcon from '@mui/icons-material/Delete';
const DataTable = ({results, setResults, columns}) => {

  const [check, setCheck] = useState(false)
  const [allChecked, setAllChecked] = useState(false);
  const [selected, setSelected] = useState([]);
  const [editID, setEditId] = useState('');

  const [editToggle, setEditToggle] = useState(false);
  const [deleteToggle, setDeleteToggle] = useState(false);

  const DECISIONS = [
      'Delete',
      'Change Group'
  ]

  const handleCheck = (e) => {
    console.log(e.target.id)
    let allResults = results;
    allResults.forEach(result => {
        if (result.id === parseInt(e.target.id))
        result.isChecked = e.target.checked
    });
    setResults(allResults)
    setCheck(!check)
    setSelected([...selected, parseInt(e.target.id)])
    if(!e.target.checked){
        setSelected(selected.filter(r => e.target.id !== r))
    }
    if(results.filter(result => result.isChecked === false).length > 0){
        setAllChecked(false)
    } else {
        setAllChecked(true)
    }
  }

  const handleAllChecked = (e) => {
        let allResults = results;
        allResults.forEach(result => result.isChecked = e.target.checked)
        setResults(allResults)
        setAllChecked(!allChecked)
        setSelected(allResults.filter(result => result.isChecked === true).map(r => r.id))
    }

  return (
    <>
    <div className='panel_main'>
        <div className='flex__between'>
            <div className='flex-align-center'>
                <Checkbox label="Select All" onChange={handleAllChecked} checked={allChecked}/>
                <Button list={DECISIONS} color="primary" ml size="large" variant='outlined' dropdown>
                    Make Decision
                </Button>
            </div>
            <div className='flex__between'>
                <SearchField />
                <Button color="secondary" ml size="medium">
                    Apply
                </Button>
            </div>
        </div>
    </div>

    <div className='panel_main'>
        <table width="100%">
            <thead>
                <tr>
                    <th></th>
                    {
                        columns.map((col) => (
                            <th align={col.align}>{col.text}</th>
                        ))
                    }
                </tr>
            </thead>
            <tbody>
                {results.map((result) => (
                <tr className="card-tr" key={result.id}>
                    <td><Checkbox resultID={result.id} onChange={handleCheck} checked={result.isChecked} /></td>
                    {
                        result.first && 
                        <td className="lh-36" style={{ width: result.first.length > 200 ? '80%' : '' }}>
                            <div className="td-hover flex__event">
                                <ModeEditIcon onClick={() => {
                                    setEditId(result.id)
                                    setEditToggle(true)
                                }} className="icon_hover" style={{ cursor: 'pointer', transition: '0.3s' }} fontSize=''/>
                                <DeleteIcon onClick={() => setDeleteToggle(false)} className="icon_hover" style={{ cursor: 'pointer', transition: '0.3s' }} fontSize='' />
                            </div>
                        {
                            result.first.length > 200 ? result.first.substring(0, 200) + " ..." : result.first
                        }
                          
                        </td>
                    }
                    {
                        result.second && <td>{result.second}</td>
                    }
                    {
                        result.third && <td>{result.third}</td>
                    }
                    {
                        result.fourth && <td align='start'>{result.fourth}</td>
                    }
                    {
                        result.fifth && <td align='center'>{result.fifth}</td>
                    }
                    {
                        result.sixth && <td align='center'>{result.sixth}</td>
                    }

                </tr>
                ))}

            </tbody>
        </table>
    </div>
    </>
  )
}

export default DataTable