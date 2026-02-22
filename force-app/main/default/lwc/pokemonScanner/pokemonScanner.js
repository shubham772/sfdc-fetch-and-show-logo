import { LightningElement, track } from 'lwc';
import getPokemonData from '@salesforce/apex/PokeApiService.getPokemonData';

export default class PokemonScanner extends LightningElement {
    @track pokemonName = 'pikachu';
    @track pokemonData;
    @track error;

    handleNameChange(event) {
        this.pokemonName = event.target.value;
    }

    handleSearch() {
        getPokemonData({ pokemonName: this.pokemonName })
            .then((result) => {
                this.pokemonData = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error.body.message;
                this.pokemonData = undefined;
            });
    }

    // Dynamic style for a "power bar" based on weight
    get calculateWidth() {
        let width = this.pokemonData.weight > 100 ? 100 : this.pokemonData.weight;
        return `width: ${width}%; background-color: #ffcc00; height: 10px; border-radius: 5px;`;
    }
}