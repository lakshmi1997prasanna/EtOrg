public class ageverify {

    public static void m(integer age)
    {
        try
        {
        if(age<18)
        {
            throw new tooyoungException('u are too young');
         }
   
        else
        {
            system.debug(age);
        }
            
             }
    catch(eXCEPTION E)
    {
        SYSTEM.debug('TOO YOUNG'+AGE);
        SYSTEM.debug(' WHAT WAS THE EXP:-'+E);
    }
    }
}