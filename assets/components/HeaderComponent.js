import '../css/HeaderComponent.css';
import React from 'react';

function HeaderComponent(){
        return(
            <div className ='header-container'>
                <div className ='title-container'>
                    <h1>MapFact</h1>
                </div>
                <div className = 'description-container'>
                    Pour scroller en apprenant!
                </div>
            </div>
        )
    }

export default HeaderComponent;

