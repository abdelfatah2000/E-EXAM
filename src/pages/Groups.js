import React from 'react'
import IconButton from '../components/Reusable Components/Icon Button/IconButton';
import VisibilityIcon from '@mui/icons-material/Visibility';
import DeleteIcon from '@mui/icons-material/Delete';
import SchoolIcon from '@mui/icons-material/School';
import DateRangeIcon from '@mui/icons-material/DateRange';
import AddIcon from '@mui/icons-material/Add';

function Groups() {
  return (
      <>
        <h1 className='headings'>Groups</h1>
        <div className='card'>
            <span className='sub-headings flex-align-center'>Group 1</span>
            <span style={{ justifyContent: 'start' }} className='flex-align-center'><SchoolIcon className="mr-2" fontSize='' /> Students : 50</span>
            <span style={{ justifyContent: 'start' }} className='flex-align-center' ><DateRangeIcon className="mr-2" fontSize='' /> Date : 20/2/2022</span>
            <div className='hover flex__center'>
            <IconButton variant="squared" icon_color="primary" icon={<VisibilityIcon style={{ marginTop: '1px' }} fontSize='' />} label="Preview & Edit" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<IconButton variant="squared" icon_color="red" icon={<DeleteIcon fontSize='' />} label='Delete' />
            </div>
        </div>
        <IconButton float variant="circled" size="large" color="secondary" icon={<AddIcon fontSize="large" />} />

    </>
  )
}

export default Groups