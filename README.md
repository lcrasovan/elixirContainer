# This container is a collection of examples for easy, baby-step elixir learning

For the moment there are two apps under the same Elixir "umbrella"

An umbrella allows us to have several Elixir apps in the same github project

Each App can be launched by itself

Preliminary steps:

1. Install Elixir and company

2. Install Elasticsearch

3. Create Shakespeare theater elasticsearch index as described here:
   https://www.elastic.co/guide/en/kibana/3.0/import-some-data.html
   and the show must go one

4. Launch an app:


```language=shell
cd apps/shakespeareBrowser

iex -S mix

ShakespeareBrowser.getAllTitles

ShakespeareBrowser.getAllRolesInPiece('Hamlet')

ShakespeareBrowser.getMainRoles
```

We get something like this: 
 
![getMainRoles result](apps/shakespeareBrowser/images/mainRoles.png?raw=true "Main Roles in Shakespeare plays") 

5. It's time to go deeper into text/word counting analysis. 
   First I would like to aknowledge the counting example from :

   https://github.com/cas27/exword_count

   I have extended it slightly here to work for array of sentences
   
6. Testing added. To run unit test simply execute in the root of the project:
   
```language=shell
mix test
```   
   