import React from 'react';
import PinchZoomPan from "react-responsive-pinch-zoom-pan";

function MapZoom(props){
    return(
        <div className = "modal-container">
            <div className = "image-container" style ={{width:'90%', height: '70%'}}>
                <PinchZoomPan zoomButtons = {false} maxScale = {4} position = 'center'>
                    <img className = "carte-zoom" src = {props.mapSource}  alt = "une carte zommée"></img>
                </PinchZoomPan>
            </div>
            <div onClick ={props.closeZoomedMap} className="close"></div>
        </div>
    );
}

export default MapZoom;