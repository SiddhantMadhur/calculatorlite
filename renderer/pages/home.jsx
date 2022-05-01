import React, { useEffect, useState } from 'react';
import Head from 'next/head';
import Link from 'next/link';
import styles from '../styles';



function Home() {

  const [result, setResult] = useState(0);
  const [input, setInput] = useState('');
  const [lastMove, setLastMove] = useState('');

  function ClearValues() {
    return (
      <div className={`${styles.button} bg-button-lightgray`}>
        <button onClick={() => {
          setInput("");
          setResult("");
        }} className={`${styles.button} bg-button-lightgray`}>
          AC
        </button>
      </div>
    )
  }

  const deleteTemp = () => {
    const temp = input.substring(0, input.length - 1);
    setInput(temp);
  }

  function DeleteValue() {
    return (
      <div className={`${styles.button} bg-button-lightgray`}>
        <button onClick={deleteTemp} className={`${styles.button} bg-button-lightgray`}>
          C
        </button>
      </div>
    )
  }

  const FunctionDial = (props) => (
    <div className={`${styles.button} bg-button-orange text-font-white`}>
      <button onClick={props.function} className={`${styles.button} text-font-white bg-button-orange`}>
        {props.symbol}
      </button>
    </div>
  )

  const Dial = (props) => (
    <div className={`${styles.button} bg-button-darkgray`}>
      <button onClick={() => {
        if (props.child === ".") {
          if (input.includes(".")) {

          } else {
            const temp = input + props.child;
            setInput(temp)
          }
        } else {
          const temp = input + props.child;
          setInput(temp)
        }
      }} className={`${styles.button} bg-button-darkgray text-font-white`} >
        {props.child}
      </button>
    </div>
  )
 
  const plus = () => {
    setLastMove('+')
    if(input!==""){
      setResult(Number.parseFloat(result) + Number.parseFloat(input))
      setInput("")
    }
  }

  const divide = () => {

  }

  const multiply = () => {

  }
  const subtract = () => {

  }
  const add = () => { }
  const equate = () => { 
    if(lastMove!=="" && input!==""){
      if(lastMove==='+'){
        plus();
        setLastMove("")
      }
    }
  }

  useEffect(()=>{console.log(lastMove)},[lastMove])

  return (
    <React.Fragment>
      <Head>
        <title>Calculator</title>
      </Head>
      <div className='text-center mt-10 '>
        <div className=' text-right mx-5 my-3'>
          {result!==""?(
            <>
              Result: {result}
            </>
          ):undefined}
          <div className='text-5xl'>
          {input === '' ? 0 : input}
          </div>
          
        </div>
        <div className=''>
          <div className='flex items-stretch flex-col mx-5 gap-y-3'>
            <div className={styles.row}>
              <ClearValues></ClearValues>
              <DeleteValue />
              <FunctionDial symbol="÷" function={divide} />
            </div>
            <div className={styles.row}>
              <Dial child="7" />
              <Dial child="8" />
              <Dial child="9" />
              <FunctionDial symbol="×" function={multiply} />
            </div>
            <div className={styles.row}>
              <Dial child="4" />
              <Dial child="5" />
              <Dial child="6" />
              <FunctionDial symbol="-" function={subtract} />
            </div>
            <div className={styles.row}>
              <Dial child="1" />
              <Dial child="2" />
              <Dial child="3" />
              <FunctionDial symbol="+" function={plus} />
            </div>
            <div className={styles.row}>
              <Dial child="0" />
              <Dial child="." />
              <Dial child="" />
              <FunctionDial symbol="=" function={equate} />
            </div>
          </div>
        </div>
      </div>
    </React.Fragment>
  );
}

export default Home;
