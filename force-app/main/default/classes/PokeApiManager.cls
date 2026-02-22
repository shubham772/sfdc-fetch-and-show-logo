public class PokeApiManager {
    
    // Future annotation allows callouts from Triggers
    @future(callout=true)
    public static void syncPokemonData(Id leadId, String pokemonName) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + pokemonName.toLowerCase().trim());
        request.setMethod('GET');
        
        try {
            HttpResponse response = http.send(request);
            
            if (response.getStatusCode() == 200) {
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                
                // Navigate the nested JSON for the image
                Map<String, Object> sprites = (Map<String, Object>) results.get('sprites');
                String imageUrl = (String) sprites.get('front_default');
                Integer weight = (Integer) results.get('weight');
                
                // Update the Lead
                Lead le = new Lead(Id = leadId);
                le.Pokemon_Sprite_URL__c = imageUrl;
                le.Pokemon_Weight__c = weight;
                
                update le;
            }
        } catch (Exception e) {
            System.debug('Error calling PokéAPI: ' + e.getMessage());
        }
    }
}