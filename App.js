import './App.css';
import Navbar from './componenets/Navbar'
import Image from './componenets/Image'
import Annonces from './componenets/Annonces'
import Footer from './componenets/Footer'

function App() {
  return (
    <div className="App">
     <Navbar />
     <Image />
     <Annonces />
     <Footer />
    </div>
    
  );
}

export default App;
