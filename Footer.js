import React from 'react'
import logo from './images/logo1.png';
import fb from './images/facebook.png'
import twitter from './images/twitter.png'
import ig from './images/instagram.png'
import li from './images/linkedin.png'
import arrow from './images/arrowpng.png'
function Footer() {
  return (
    <div >
        <div className='Footer'>
     <img className ='logo1' src = {logo} alt='logo' />
     <div className='P'>
     <p>
        TUTOR est un site web pour la publication et la consultation des annonces de cours de soutien scolaire
        </p> 
        </div>
        <div className='linksFooter'>
            <a id='home' href="/acceuil">
              Acceuil</a><br></br>
           <a href="/listeFavoris">Liste des favoris</a><br></br>
            <a href="/Publier">Publier une annonce</a><br></br>
            <a href="/profile">accéder au profil</a><br></br>
        </div>
        <div className='social'>
           
            <div className='socialElement'>
                <img className='socialImg' src = {fb} alt='facebook' />
                <p>Facebook</p>
            </div>
            <div className='socialElement'>
                <img  className='socialImg' src = {ig} alt='facebook' />
                <p>instagram</p>
            </div>
            <div className='socialElement'>
                <img className='socialImg' src = {twitter} alt='facebook' />
                <p>Twitter</p>
            </div>
            <div className='socialElement'>
                <img className='socialImg' src = {li} alt='facebook' />
                <p>LinkedIn</p>
            </div>
        </div>
        <a id="a" href="#top">
        <img className='arrow' src={arrow} alt='/' />
        </a>
        </div>
        <p className='rights'>2022 Lift Media. All rights reserved.</p>
    </div>
  )
}

export default Footer