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

    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getPokemonList() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        // Fetching the first 100 Pokemon
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon?limit=100');
        request.setMethod('GET');
        
        List<Map<String, String>> options = new List<Map<String, String>>();
        
        try {
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == 200) {
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                List<Object> pokemonList = (List<Object>) results.get('results');
                
                for (Object obj : pokemonList) {
                    Map<String, Object> pokemon = (Map<String, Object>) obj;
                    String name = (String) pokemon.get('name');
                    
                    Map<String, String> option = new Map<String, String>();
                    option.put('label', name.capitalize()); // What the user sees
                    option.put('value', name);             // What the code uses
                    options.add(option);
                }
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return options;
    }
}