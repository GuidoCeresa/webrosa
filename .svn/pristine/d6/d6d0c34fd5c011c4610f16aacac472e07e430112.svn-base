package it.algos.rosa

class Agenda {

    String nome
    String cognome
    Localita localita
    String note
    String telefono
    String email
    Categoria categoria


    static constraints = {
        nome()
        cognome()
        telefono()
        categoria(nullable: true)
        localita(nullable: true)
        note(widget: 'textarea')
        email()
    }

    static mapping = {
        note type: 'text'
    }

    /**
     * Forza il primo carattere della stringa a maiuscolo
     *
     * Restituisce una stringa
     * Un numero ritorna un numero
     * Un nullo ritorna un nullo
     * Un oggetto non stringa ritorna uguale
     * @param entrata stringa in ingresso
     * @return uscita string in uscita
     */
    private static primaMaiuscola = {entrata ->
        // variabili e costanti locali di lavoro
        def uscita = entrata
        String primo
        String rimanente

        if (entrata && entrata in String) {
            primo = entrata.substring(0, 1)
            primo = primo.toUpperCase()
            rimanente = entrata.substring(1)
            uscita = primo + rimanente
        }// fine del blocco if

        // valore di ritorno
        return uscita
    } // fine della closure

    /**
     * metodo chiamato automaticamente da Grails
     * prima di creare un nuovo record
     */
    def beforeInsert = {
        cognome = primaMaiuscola(cognome)
        localita = primaMaiuscola(localita)
    }

    /**
     * metodo chiamato automaticamente da Grails
     * prima di registrare un record esistente
     */
    def beforeUpdate = {
    }

    /**
     * metodo chiamato automaticamente da Grails
     * prima di cancellare un record
     */
    def beforeDelete = {
    }

    /**
     * metodo chiamato automaticamente da Grails
     * dopo che il record è stato letto dal database e
     * le proprietà dell'oggetto sono state aggiornate
     */
    def onLoad = {
    }

}
