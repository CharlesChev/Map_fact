import '../css/MapCardComponent.css';
import React from 'react';

function MapCardComponent(props){
    return(
        <div className ="map-card">
            <h2 key={props.mapTitleKey }><p>{props.mapTitle}</p></h2>
            <div className = "description" key={props.mapDescriptionKey}>{props.mapDescription}</div>
            <div className="carte-mini-container">
                <img className = "carte-mini" src= {props.mapPath} alt = "une carte" onClick ={props.zoom}key={props.mapPathKey}></img>
            </div>
            <div className = "sources" key={props.mapSourcesKey}>Sources: {props.mapSources}</div>
        </div>
    );
}

export default MapCardComponent;