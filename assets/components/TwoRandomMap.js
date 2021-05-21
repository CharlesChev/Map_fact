import React from 'react';
import MapCardComponent from './MapCardComponent.js';


class TwoRandomMap extends React.Component{
    constructor(props){
        super(props);
        this.fetchTwoMap=this.fetchTwoMap.bind(this);
        this.handleScroll=this.handleScroll.bind(this);
        this.state = {
            maps: [], countScroll:0, pagesScrolled:0
        };
    }


    componentDidMount(){
        this.fetchTwoMap();
        window.addEventListener('scroll',this.handleScroll)
    }

    
    fetchTwoMap(){
        fetch('/two_random')
        .then(function(response){
            return response.json();
        }).then((data)=>{
            const tempState = this.state.maps;
            tempState.push(data)
            this.setState({maps:tempState});
          
        })
    }

    handleScroll(event){
        /*this.setState({countScroll:this.state.countScroll+1});
        if (this.state.countScroll%20 == 0){
            this.setState({pagesScrolled:this.state.pagesScrolled+1}); 
            window.scrollTo({left:0,top:this.props.hght});
        }else{
            if(this.state.pagesScrolled == 0){
                window.scrollTo({left:0,top:0});
            }else{
                window.scrollTo({left:0,top:this.props.hght*this.state.pagesScrolled});
            }
        }*/
        const target = event.target;
        if (target.scrollingElement.scrollHeight - target.scrollingElement.scrollTop <= target.scrollingElement.clientHeight + 1){
            this.fetchTwoMap();
             
        }
    }
    
   
    render(){
        
        return(
            <div className = "map-container">
            {
                this.state.maps[0]
                ?<div className ="oneMap">
                    {
                        this.state.maps.map(
                            (map, index) =>
                            <div>
                                <div className = "cardWrapper snap-scroll" style={{height:this.props.hght}}>
                                    <MapCardComponent 
                                        mapTitle={map[0].title} mapTitleKey={index + map[0].title}
                                        mapDescription={map[0].description} mapDescriptionKey={index + map[0].description}
                                        mapPath={map[0].mapPath} mapPathKey={index + map[0].mapPath} zoom={this.props.handleClickOnMap}
                                        mapSources={map[0].sources} mapSourcesKey={index + map[0].sources}
                                    />
                                </div>
                                <div className = "cardWrapper snap-scroll" style={{height:this.props.hght}}>
                                    <MapCardComponent 
                                        mapTitle={map[1].title} mapTitleKey={index + map[1].title}
                                        mapDescription={map[1].description} mapDescriptionKey={index + map[1].description}
                                        mapPath={map[1].mapPath} mapPathKey={index + map[1].mapPath} zoom={this.props.handleClickOnMap}
                                        mapSources={map[1].sources} mapSourcesKey={index + map[1].sources}
                                    />
                                </div>
                            </div>
                        )
                    }
                                  
                </div>
                :<p>Chargement...</p>
            }
            </div>
        );
    }
}

export default TwoRandomMap;

