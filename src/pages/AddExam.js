import React, { useState } from 'react'
import IconButton from '../components/Reusable Components/Icon Button/IconButton';
import InputField from '../components/Reusable Components/Input Field/InputField'
import TimeInterval from '../components/Reusable Components/Time Interval/TimeInterval';
import ReplayIcon from '@mui/icons-material/Replay';
import AddIcon from '@mui/icons-material/Add';
import CloseIcon from '@mui/icons-material/Close';
import Button from '../components/Reusable Components/Button/Button';

function AddExam() {
  const [groups, setGroups] = useState([]);
  const [group, setGroup] = useState({
    group: '',
    from: '',
    to: ''
  });


  const groupList = [
    1,
    2,
    3
  ]
  const addGroup = () => {
    setGroups([...groups, group]);
    setGroup({
      group: '',
      from: '',
      to: ''
    });
  }

  return (
    <>
        <h1 className='headings'>Add Exam</h1>
        <div className="panel_main">
            <h3 className="sub-headings">Settings</h3>
            <div className="grid_two_columns mt-26">
            <InputField label="Name" />
            <InputField label="Time" />
            </div>
        </div>
        <div className="panel_main">
            <h3 className="sub-headings">Groups</h3>
            <div className="row mt-26 flex-align-center">
                <div className='col-3'><InputField dropdown list={groupList} placeholder="Select Group" value={group.group} onchange={(e) => setGroup({...group, group: e.target.dataset.selected})} column label="Group" /></div>
                <div className='col-8'><TimeInterval label setFrom={(e) => setGroup({...group, from: e.target.value})} setTo={(e) => setGroup({...group, to: e.target.value})} from={group.from} to={group.to} /></div>
                <div style={{ marginTop: 'auto' }} className='col-1 flex__between'>
                  <IconButton color="orange" variant="circled" size="medium" icon={<ReplayIcon fontSize='small' />} />
                  <IconButton onclick={addGroup} variant="circled" size="medium" color="secondary" icon={<AddIcon fontSize="small" />} />
                </div>
            </div>
            {
              groups.map((g, index) =>             
              <div className="row mt-26 flex-align-center">
                <div className='col-3'><InputField value={g.group} onchange={(e) => {
                  let groupsList = [...groups];
                  groupsList[index] = {...groupsList[index], group: e.target.value}
                  setGroups(groupsList);
                }} column /></div>

                <div className='col-8'><TimeInterval setFrom={(e) => {
                  let groupsList = [...groups];
                  groupsList[index] = {...groupsList[index], from: e.target.value}
                  setGroups(groupsList);
                }} setTo={(e) => {
                  let groupsList = [...groups];
                  groupsList[index] = {...groupsList[index], to: e.target.value}
                  setGroups(groupsList);
                }} from={g.from} to={g.to} /></div>
                <div style={{ alignItems: 'flex-right' }} className='col-1'>
                  <IconButton onclick={() => setGroups(groups.filter(e => e.group !== g.group))} color="red" variant="circled" size="medium" icon={<CloseIcon fontSize='small' />} />
                </div>
              </div>
          )
            }
        </div>
        <Button size="medium">Save</Button>
    </>
  )
}

export default AddExam