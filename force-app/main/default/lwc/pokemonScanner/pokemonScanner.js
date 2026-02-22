import { LightningElement, api, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; // 1. Import the Toast module
import getPokemonList from '@salesforce/apex/PokeApiService.getPokemonList';
import getPokemonData from '@salesforce/apex/PokeApiService.getPokemonData';

export default class PokemonScanner extends LightningElement {
    @track recordId; 
    @track pokemonOptions = [];
    @track pokemonData;
    @track selectedPokemon = '';

    @wire(CurrentPageReference)
    getStateParameters(pageRef) {
        if (pageRef && pageRef.attributes && pageRef.attributes.recordId) {
            this.recordId = pageRef.attributes.recordId;
        }
    }

    @wire(getPokemonList)
    wiredPokemon({ error, data }) {
        if (data) this.pokemonOptions = data;
    }

    handleDropdownChange(event) {
        this.selectedPokemon = event.detail.value;
        this.fetchAndStamp();
    }

    fetchAndStamp() {
        getPokemonData({ pokemonName: this.selectedPokemon })
            .then((result) => {
                this.pokemonData = result;
                this.updateLeadRecord();
            })
            .catch((error) => {
                this.showToast('Error', 'Could not fetch Pokemon data', 'error');
            });
    }

    updateLeadRecord() {
        if (!this.recordId) {
            this.showToast('System Error', 'Record ID not found', 'error');
            return;
        }

        const fields = {};
        fields['Id'] = this.recordId;
        fields['Favorite_Pokemon__c'] = this.pokemonData.name;
        fields['Pokemon_Sprite_URL__c'] = this.pokemonData.image;
        fields['Pokemon_Weight__c'] = this.pokemonData.weight;

        updateRecord({ fields })
            .then(() => {
                // 2. Success Toast
                this.showToast(
                    'Success!', 
                    this.pokemonData.name.toUpperCase() + ' has been assigned to this Lead.', 
                    'success'
                );
            })
            .catch(error => {
                this.showToast('Update Failed', error.body.message, 'error');
            });
    }

    // 3. Helper method to keep the code clean
    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant, // success, error, warning, or info
        });
        this.dispatchEvent(event);
    }
}