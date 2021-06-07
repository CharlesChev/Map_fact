import React from 'react';
import MapCardComponent from './MapCardComponent.js';
import HeaderComponent from '../components/HeaderComponent.js';

class HomeComponent extends React.Component{
    constructor(props){
        super(props);
        this.fetchFirstMap = this.fetchFirstMap.bind(this);
        this.state = {
            map: [], modalMentions:false
        };
    }

    componentDidMount(){
        this.fetchFirstMap();
    }

    

    fetchFirstMap(){
        fetch('/random')
        .then(function(response){
            return response.json();
        }).then((data)=>{
            const tempState = this.state.map;
            tempState.push(data)
            this.setState({map:tempState});
          
        })
    }

    render(){
        return(
            <div className = 'home-container snap-scroll' style={{height:this.props.hght}}>
                <HeaderComponent/>
                <div className = 'first-map-container'>
                    <div className = 'mentions-legales'><a href="/mentions">Mentions légales</a></div>
                    {
                        this.state.map[0]
                        ?<div>
                            {
                                this.state.map.map(
                                    (map, index) =>
                                        <MapCardComponent 
                                            mapTitle={map.title} mapTitleKey={index + map.title}
                                            mapDescription={map.description} mapDescriptionKey={index + map.description}
                                            mapPath={map.mapPath} mapPathKey={index + map.mapPath} zoom={this.props.handleClickOnMap}
                                            mapSources={map.sources} mapSourcesKey={index + map.sources}
                                        />
                                    )
                            }
                                        
                        </div>
                        :<p>Chargement...</p>
                    }
                </div>
                
                <div className = "instruction">
                    <i className="fas fa-arrow-circle-up"></i>
                    <p>Clique sur la carte pour zoomer!</p>
                    
                    <p>Commence à scroller!</p>
                    <i className="fas fa-arrow-circle-down"></i>
                </div>

            </div>          
        );
    }
}


export default HomeComponent;