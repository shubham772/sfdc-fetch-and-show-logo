public class PokeApiService {
    
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getPokemonData(String pokemonName) {
        // Clean the input
        String formattedName = pokemonName.toLowerCase().trim();
        String endpoint = 'https://pokeapi.co/api/v2/pokemon/' + formattedName;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        try {
            HttpResponse response = http.send(request);
            
            if (response.getStatusCode() == 200) {
                // Parse the JSON response
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                
                // Navigate the 'sprites' object to get the image URL
                Map<String, Object> sprites = (Map<String, Object>) results.get('sprites');
                
                // Build a simple map to send back to our LWC
                Map<String, Object> pokemonInfo = new Map<String, Object>();
                pokemonInfo.put('name', (String)results.get('name'));
                pokemonInfo.put('weight', (Integer)results.get('weight'));
                pokemonInfo.put('image', (String)sprites.get('front_default'));
                
                return pokemonInfo;
            } else {
                throw new AuraHandledException('Pokemon not found. Check the spelling!');
            }
        } catch (Exception e) {
            throw new AuraHandledException('Error calling API: ' + e.getMessage());
        }
    }
}