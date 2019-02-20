import React from 'react';

import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component{

    constructor(props){
        super(props);
    }

    getEmbededUrls(){
        if (this.props.gifs) {
            return this.props.gifs.map(gif => gif.embed_url);
        }
    }

    render(){
        // console.log(this.props.gifs);
        if (this.props.gifs){
            console.log(this.getEmbededUrls());
        }
        return (
        <div>
            <h1>Search Results</h1>
            {this.getEmbededUrls().map(url => (
                <GiphysIndexItem embed_url = {url}/>
            ))}
        </div>
        )
    }
}

export default GiphysIndex;
//                 <iframe src="https://giphy.com/embed/JIX9t2j0ZTN9S" width="480" height="480" frameBorder="0" allowFullScreen></iframe><p></p>
//             <img src={"https://giphy.com/gifs/JIX9t2j0ZTN9S}></img>

// this.props.gifs.map(gif => {
//     return <GiphysIndex embed_url={gif.embed_url} />
// })