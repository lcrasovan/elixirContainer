defmodule ShakespeareBrowser do
  import Tirexs.Search

  def getAllTitles do

      query = search [index: "shakespeare"] do
        size 0
        aggs do
          play_names do
            terms field: "play_name", size: 100, order: ["_term": "asc"]
          end
        end
      end

      {:ok, code, aggregations} = Tirexs.Query.create_resource(query)

      IO.puts "Shakespeare pieces:\n"

      playsInfo = aggregations[:aggregations][:play_names][:buckets]

      Enum.each playsInfo, fn(playInfo) -> IO.puts "#{playInfo[:key]}: #{playInfo[:doc_count]} lines"  end

  end

  def getAllRolesInPiece do

    queryRoles = search [index: "shakespeare"] do
      size 0
      query do
        bool do
          must do
            match "play_name", "Hamlet"
          end
        end
      end
      aggs do
        speakers do
          terms field: "speaker", size: 100
        end
      end
    end

    {:ok, code, aggregations} = Tirexs.Query.create_resource(queryRoles)

    IO.puts "Speakers in Hamlet:\n"

    speakers = aggregations[:aggregations][:speakers][:buckets]

    Enum.each speakers, fn(speaker) -> IO.puts "#{speaker[:key]}: #{speaker[:doc_count]} interventions"  end

  end



end
