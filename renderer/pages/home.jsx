import React, { useState } from 'react';
import Head from 'next/head';
import Link from 'next/link';
import styles from '../styles';



function Home() {

  const [result, setResult] = useState(0);
  const [input, setInput] = useState('');

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

  function DeleteValue() {
    return (
      <div className={`${styles.button} bg-button-lightgray`}>
        <button onClick={() => {
          const temp = input.substring(0, input.length - 1);
          setInput(temp);
        }} className={`${styles.button} bg-button-lightgray`}>
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
        if(props.child==="."){
          if(input.includes(".")){

          }else{
            const temp = input + props.child;
            setInput(temp)
          }
        }else{
          const temp = input + props.child;
          setInput(temp)
        }
      }} className={`${styles.button} bg-button-darkgray text-font-white`} >
        {props.child}
      </button>
    </div>
  )


  const plus = () => {

  }

  const divide = () => {

  }

  const multiply = () => {

  }
  const subtract = () => {

  }
  const add = () => { }
  const equate = () => { }

  return (
    <React.Fragment>
      <Head>
        <title>Calculator</title>
      </Head>
      <div className='text-center mt-20 '>
        <div className='text-5xl text-right mx-5 my-3'>
          {input === '' ? 0 : input}
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
              <FunctionDial symbol="×" function={multiply} />
            </div>
            <div className={styles.row}>
              <Dial child="1" />
              <Dial child="2" />
              <Dial child="3" />
              <FunctionDial symbol="×" function={multiply} />
            </div>
            <div className={styles.row}>
              <Dial child="0" />
              <Dial child="." />
              <Dial child="" />
              <FunctionDial symbol="×" function={multiply} />
            </div>
          </div>
        </div>
      </div>
    </React.Fragment>
  );
}

export default Home;
