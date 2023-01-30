import React from 'react'
import "../App.css";
import logo from './images/logo1.png';


function Navbar() {
  return (
    <div className='Navbar'>
      <img className='logo' src={logo} alt="logo" />
      <div>
      <input type="text" placeholder='search...' />
      <button>Search</button>
      </div>
      
        <div className='links'>
            <a id='home' href="/">
              Acceuil</a>
           <a href= "/">Liste des favoris</a>
            <a href="/Publier">Publier une annonce</a>
            <a to="/profile">accéder au profil</a>
        </div>
     
       
     
           
            
      
    </div>
  )
}

export default Navbar