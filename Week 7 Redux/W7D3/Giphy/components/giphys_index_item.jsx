import React from "react";

class GiphyIndexItem extends React.Component{

    constructor(props){
        super(props);
    }

    render(){
        return(
            <iframe src={this.props.embed_url} width="480" height="480" frameBorder="0" allowFullScreen></iframe>
        )
    }
}

export default GiphyIndexItem;