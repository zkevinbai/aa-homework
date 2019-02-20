import React from "react";

class GiphyIndexItem extends React.Component{

    constructor(props){
        super(props);
    }

    render(){
        return(
            <iframe className={"gif" + this.props.idx + "item"} src={this.props.embed_url} width="420" height="420" frameBorder="-10" allowFullScreen></iframe>
        )
    }
}

export default GiphyIndexItem;