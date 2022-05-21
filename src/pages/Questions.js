import React, {useState, useEffect} from 'react';
import DataTable from '../components/Reusable Components/Data Table/DataTable';
import IconButton from '../components/Reusable Components/Icon Button/IconButton';
import AddIcon from '@mui/icons-material/Add';
import Modal from '../components/Reusable Components/Modal/Modal'
import TextArea from '../components/Reusable Components/Input Field/TextArea'
import InputField from '../components/Reusable Components/Input Field/InputField'
import RadioButton from '../components/Reusable Components/Radio Button/RadioButton';

const Questions = () => {
    const [records, setRecords] = useState([])

    const [addModal, setAddModal] = useState(false);
    
    const [question, setQuestion] = useState({
      difficulty: 'Hard',
      is_true_false: false,
      chapter: 0
    });

    const [chapter, setChapter] = useState({
      id: 1,
      name: 'Select Chapter',
      level: ''
    })

    const [chapters, setChapters] = useState([
      'Chapter One',
      'Chapter Two',
      'Chapter Three'
    ])

    const [answers, setAnswers] = useState([])
    const [answer, setAnswer] = useState('')


    const addAnswer = () => {
      let lastId = answers.length > 0 ? answers[answers.length - 1].id + 1 : 1;
      setAnswers([...answers, {
        text: answer,
        id: lastId 
      }])
      setAnswer('')
    }

    const difficulties = [
      'Easy',
      'Medium',
      'Hard'
    ]

    const types = [
      'MCQ',
      'True or False'
    ]

  
    const click = () => {
      setAddModal(true)
    }
    useEffect(() => {
      let fetchedArr = [
        {
          id: 1,
          question_text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
          difficulty: "Hard",
          degree: "5",
          chapter: 'Chapter One',
          is_true_false: false,
          isChecked: false
        },
        {
          id: 2,
          question_text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
          difficulty: "Medium",
          degree: "15",
          chapter: 'Chapter Two',
          is_true_false: false,
          isChecked: false
        },
      ]
      let arr = []
      fetchedArr.forEach((res) => arr.push({
        id: res.id,
        first: res.question_text,
        fifth: res.difficulty,
        sixth: res.degree
      }))
      setRecords(arr)
    }, [])

  const COLUMNS = [
    {
      text: 'Question Text',
      align: 'start'
    },
    {
      text: 'Difficulty',
      align: 'center'
    },
    {
      text: 'Degree',
      align: 'center'
    }
  ]

  const EditModal = (props) => {
    return (
      <Modal title="Add Question" toggle={addModal} setToggle={setAddModal}>
          <TextArea label="Question Text" />
          <div className="row mt-26">
            <div className="col-6">
              <InputField label="Degree" />
            </div>
            <div className="col-6">
              <InputField label="Difficulty" value={question.difficulty} dropdown list={difficulties} onchange={(e) => setQuestion({...question, difficulty: e.target.dataset.selected})} autoWidth />
            </div>
          </div>
          <div className='row mt-26'>
            <div className="col-6">
              <InputField label="Type of question" dropdown list={types} value={question.is_true_false ? 'True or False' : 'MCQ'} onchange={(e) => setQuestion({...question, is_true_false: e.target.dataset.selected === 'True or False' ? true : false})} />
            </div>
            <div className='col-6'>
              <InputField autoWidth withInput label="Chapter" type="number" dropdown list={chapters} setList={setChapters} value={chapter.name} onchange={(e) => {
                setChapter({...chapter, name: e.target.dataset.selected});
                setQuestion({...question, chapter: e.target.dataset.id})
              }} />
            </div>
          </div>
          <div className='row mt-26'>
              <div className='col-6'>
                <div className='flex'>
                <InputField keypress={addAnswer} mr7 label="Answers" value={answer} onchange={(e) => setAnswer(e.target.value)} />
                <IconButton onclick={addAnswer} variant="circled" size="medium" color="secondary" icon={<AddIcon fontSize="small" />} />
                </div>
                <div className="flex-align-center mt-26 radio-toolbar" style={{ flexWrap: 'wrap' }} >
                  {
                    answers.map(answer => <RadioButton list={answers} setList={setAnswers} id={answer.id} label={answer.text} />)
                  }
                </div>
              </div>
          </div>
        </Modal>
    )
  }
  return (
    <div>
        <Modal title="Add Question" toggle={addModal} setToggle={setAddModal}>
          <TextArea label="Question Text" />
          <div className="row mt-26">
            <div className="col-6">
              <InputField label="Degree" />
            </div>
            <div className="col-6">
              <InputField label="Difficulty" value={question.difficulty} dropdown list={difficulties} onchange={(e) => setQuestion({...question, difficulty: e.target.dataset.selected})} autoWidth />
            </div>
          </div>
          <div className='row mt-26'>
            <div className="col-6">
              <InputField label="Type of question" dropdown list={types} value={question.is_true_false ? 'True or False' : 'MCQ'} onchange={(e) => setQuestion({...question, is_true_false: e.target.dataset.selected === 'True or False' ? true : false})} />
            </div>
            <div className='col-6'>
              <InputField autoWidth withInput label="Chapter" type="number" dropdown list={chapters} setList={setChapters} value={chapter.name} onchange={(e) => {
                setChapter({...chapter, name: e.target.dataset.selected});
                setQuestion({...question, chapter: e.target.dataset.id})
              }} />
            </div>
          </div>
          <div className='row mt-26'>
              <div className='col-6'>
                <div className='flex'>
                <InputField keypress={addAnswer} mr7 label="Answers" value={answer} onchange={(e) => setAnswer(e.target.value)} />
                <IconButton onclick={addAnswer} variant="circled" size="medium" color="secondary" icon={<AddIcon fontSize="small" />} />
                </div>
                <div className="flex-align-center mt-26 radio-toolbar" style={{ flexWrap: 'wrap' }} >
                  {
                    answers.map(answer => <RadioButton list={answers} setList={setAnswers} id={answer.id} label={answer.text} />)
                  }
                </div>
              </div>
          </div>
        </Modal>
        <h3 className="headings">Questions</h3>
        <DataTable editModal={EditModal} setEdit={setQuestion} columns={COLUMNS} results={records} setResults={setRecords} />
        <IconButton onclick={click} float variant="circled" size="large" color="secondary" icon={<AddIcon fontSize="large" />} />
    </div>
  )
}

export default Questions