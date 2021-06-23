import React from 'react';
import HomeComponent from './HomeComponent.js';
import TwoRandomMap from './TwoRandomMap.js';
import MapZoom from './MapZoom.js';

class MainComponent extends React.Component{
    constructor(props){
        super(props);
        this.handleClickOnMap = this.handleClickOnMap.bind(this);
        this.noScroll = this.noScroll.bind(this);
        this.state = {
             winHght:null, currentZoomedMap:null
        }
    }

    componentDidMount(){
        this.setState({winHght:window.innerHeight})
    }

    noScroll(){
        let x = window.scrollX;
        let y = window.scrollY;
        window.scrollTo(x,y);
    }

    handleClickOnMap(event){
        if (this.state.currentZoomedMap === null){
            this.setState({currentZoomedMap: event.target.attributes.src.nodeValue});
            window.addEventListener('scroll',this.noScroll);
        }else{
            this.setState({currentZoomedMap: null});
            window.removeEventListener('scroll', this.noScroll);
        }
    }

    render(){
        return(
            <div>
                <HomeComponent hght={this.state.winHght} handleClickOnMap={this.handleClickOnMap}/>
                <TwoRandomMap hght={this.state.winHght} handleClickOnMap={this.handleClickOnMap}/>
                {
                this.state.currentZoomedMap
                ?<MapZoom mapSource = {this.state.currentZoomedMap} closeZoomedMap ={this.handleClickOnMap}/>
                :null
            }
            </div>
        )
    }
}

export default MainComponent;