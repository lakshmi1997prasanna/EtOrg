trigger leadtrigger on Lead (After insert) {
        RoundRobin.updateownerId(Trigger.NewMap.keySet());
}