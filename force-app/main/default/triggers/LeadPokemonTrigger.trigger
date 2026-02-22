trigger LeadPokemonTrigger on Lead (after insert, after update) {
    for (Lead l : Trigger.new) {
        // Only run if Favorite_Pokemon__c is filled and has changed
        if (String.isNotBlank(l.Favorite_Pokemon__c)) {
            Boolean isInsert = Trigger.isInsert;
            Boolean isUpdate = Trigger.isUpdate && (l.Favorite_Pokemon__c != Trigger.oldMap.get(l.Id).Favorite_Pokemon__c);
            
            if (isInsert || isUpdate) {
                // Call the @future method
                PokeApiManager.syncPokemonData(l.Id, l.Favorite_Pokemon__c);
            }
        }
    }
}