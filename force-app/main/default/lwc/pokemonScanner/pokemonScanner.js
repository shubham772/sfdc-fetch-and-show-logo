import { LightningElement, track, wire } from 'lwc';
import getPokemonList from '@salesforce/apex/PokeApiService.getPokemonList';
import getPokemonData from '@salesforce/apex/PokeApiService.getPokemonData';

export default class PokemonScanner extends LightningElement {
    @track pokemonOptions = [];
    @track selectedPokemon = '';
    @track pokemonData;
    @track isLoading = false;

    // Load the dropdown list on startup
    @wire(getPokemonList)
    wiredPokemon({ error, data }) {
        if (data) {
            this.pokemonOptions = data;
        } else if (error) {
            console.error(error);
        }
    }

    handleDropdownChange(event) {
        this.selectedPokemon = event.detail.value;
        this.fetchDetails();
    }

    fetchDetails() {
        this.isLoading = true;
        getPokemonData({ pokemonName: this.selectedPokemon })
            .then((result) => {
                this.pokemonData = result;
                this.isLoading = false;
            })
            .catch((error) => {
                console.error(error);
                this.isLoading = false;
            });
    }
}