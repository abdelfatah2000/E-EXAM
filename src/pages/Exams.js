import React from 'react'
import TimerOutlinedIcon from '@mui/icons-material/TimerOutlined';
import DateRangeIcon from '@mui/icons-material/DateRange';
import HelpCenterIcon from '@mui/icons-material/HelpCenter';
import IconButton from '../components/Reusable Components/Icon Button/IconButton';
import VisibilityIcon from '@mui/icons-material/Visibility';
import DeleteIcon from '@mui/icons-material/Delete';
import AddIcon from '@mui/icons-material/Add';
import {useNavigate} from 'react-router-dom'

const Exams = () => {
  const history = useNavigate()
  const click = () => {
    history('/app/exams/add-exam')
  }
  return (
    <>
    <h1 className='headings'>Exams</h1>
    <div className='card'>
        <span className='sub-headings flex-align-center'>Exam 1</span>
        <span style={{ justifyContent: 'start' }} className='flex-align-center'><TimerOutlinedIcon className="mr-2" fontSize='' /> Time : 20 min</span>
        <span className='flex-align-center'><HelpCenterIcon className="mr-2" fontSize='' />Questions: 40</span>
        <span style={{ justifyContent: 'start' }} className='flex-align-center' ><DateRangeIcon className="mr-2" fontSize='' /> Date : 20/2/2022</span>
        <div className='hover flex__center'>
          <IconButton variant="squared" onclick={click} icon_color="primary" icon={<VisibilityIcon style={{ marginTop: '1px' }} fontSize='' />} label="Preview & Edit" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<IconButton variant="squared" icon_color="red" icon={<DeleteIcon fontSize='' />} label='Delete' />
        </div>
    </div>
    <IconButton onclick={click} float variant="circled" size="large" color="secondary" icon={<AddIcon fontSize="large" />} />
    </>
  )
}

export default Exams