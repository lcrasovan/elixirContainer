# This container is a collection of examples for easy, baby-step elixir learning

For the moment there are two apps under the same Elixir "umbrella"
An umbrella allows us to have several apps in the same github project
Each App can be launched by itself

Preliminary steps:

1. Install Elixir and company

2. Install Elasticsearch

3. Create Shakespeare theater elasticsearch index as described here:
   https://www.elastic.co/guide/en/kibana/3.0/import-some-data.html
   and the show must go one

4. Launch an app:

´´´
> cd apps/application_two
> iex -S mix
> ApplicationTwo.getTitles
´´´
