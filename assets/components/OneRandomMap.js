import React from 'react';
import PinchZoomPan from "react-responsive-pinch-zoom-pan";

class OneRandomMap extends React.Component{
    constructor(props){
        super(props);
        this.handleScroll = this.handleScroll.bind(this);
        this.state = {
                maps: []
            };
        
    }


    componentDidMount(){
        this.fetchData();
    }

    fetchData(){
        fetch('/random')
        .then(function(response){
            return response.json();
        }).then((data)=>{
            const tempState = this.state;
            tempState.maps.push(data)
            this.setState({map:tempState.map});
          
        })
    }
    
    handleScroll(event){
       const target = event.target;
       let soustrac = target.scrollHeight - target.scrollTop
       console.log('scrollHeight: '+target.scrollHeight+' /// scrollTop '+target.scrollTop+' /// scrollHeight-scrollTop: '+soustrac+' /// clientHeight :'+target.clientHeight );
       if (target.scrollHeight - target.scrollTop <= target.clientHeight){
            
            this.fetchData();
            console.log("mappop")
       }
        
    }
  


    render(){
        return(
            <div className = "ladiv" style = {{height:600}} onScroll={this.handleScroll}>
            {
                this.state.maps[0]
                ?<div id = "oneMapSelect" className ="oneMap">
                    <button onClick={()=>this.fetchData()}>
                        Push it to the limit!!!
                    </button>
                    {
                        this.state.maps.map(
                            (map, index) =>
                                <div>
                                    <h1 key={index + map.title }>{map.title}</h1>
                                    <div className = "description" key={index + map.description}>{map.description}</div>
                                    <div style={{ width: '500px', height: '500px' }}>
                                        <PinchZoomPan zoomButtons = {false} maxScale = {4}>
                                            <img className = "carteMini" src= {map.mapPath} alt = "une carte" key={index + map.mapPath}></img>
                                        </PinchZoomPan>
                                    </div>
                                    <div className = "sources" key={index + map.sources}>{map.sources}</div>
                                </div>
                            
                        )
                    }
                                  
                </div>
                :<p>Loading...</p>
            }
            </div>
        );
    }
}

export default OneRandomMap;