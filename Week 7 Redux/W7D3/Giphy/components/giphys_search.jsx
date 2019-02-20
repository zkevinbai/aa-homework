import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            query: "",
        };
    }

    giphySearch(event){
        event.preventDefault();
        this.props.fetchSearchGiphys(this.state.query);
    }

    handleChange(event){
        this.setState({
            query: event.target.value,
        });
    }

    render(){
        console.log(this.props.giphys[0]);
        window.gif = this.props.giphys[0];
        return (
            <div className="content">
                <form className="search" onSubmit={ (e) => this.giphySearch(e) } >
                    <label><h1 className="title">Giphy Search</h1>
                        <input type="text" onChange={ (e) => this.handleChange(e) }></input>
                    </label>
                    <br></br>
                    <input type="submit"></input>
                </form>
                <GiphysIndex gifs={this.props.giphys} />
            </div>
        )
    }
}

export default GiphysSearch;