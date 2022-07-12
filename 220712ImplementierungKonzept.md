# Konzept für die Implementierung von UniPairSity 

## Notwendige Funktionalitäten/Module 

### Profil Setup 
* Frontend
  * Formular in dem Personen Daten eingetragen werden können + Senden Button 
  * Post Request mit dem User an Backend abseten 

### Swipen 
  * Darstellung der Uni mit Mock Informationen 
    * Get All Request 
  * Liken/Disliken der Uniseiten 
    * Update Uni 
  * Uni auswählen 
    * Update User 

### Packliste
* Packliste anzeigen 
  * Get All Packlsiten Items 
* Packlisten Element abhaken 
  * Update Packlsiten Elemente 

### Portierbarkeit 
* Button um Personen Daten anzeigen zu lassen 
  * Get All Personen Daten 
* Button um alle Daten zu löschen 
  * Delte User (Alle Daten sind bei uns nur beim User)

### Standards

#### RSS - Feed 
* Seite um RSS Feed zu abonieren und anzuzeigen 

#### iCal 
(Optional)
* Mock Kalender anlegen und über ical abonnierbar machen 
