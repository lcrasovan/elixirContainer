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

  def getAllRolesInPiece(piece) do

    IO.puts "#{piece} \n"

    queryRoles = search [index: "shakespeare"] do
      size 0
      query do
        bool do
          must do
            match "play_name", "#{piece}"
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

    IO.puts "Speakers in #{piece} :\n"

    speakers = aggregations[:aggregations][:speakers][:buckets]

    Enum.each speakers, fn(speaker) -> IO.puts "#{speaker[:key]}: #{speaker[:doc_count]} interventions"  end

  end


  def getMainRoles do

    queryRoles = search [index: "shakespeare"] do
      size 0
      aggs do
        plays do
          terms field: "play_name", size: 10
          aggs do
            speakers do
              terms field: "speaker", size: 5
            end
          end
        end
      end
    end

    {:ok, code, aggregations} = Tirexs.Query.create_resource(queryRoles)

    plays = aggregations[:aggregations][:plays][:buckets]

    for play <- plays do
      IO.puts "Most important roles in #{play[:key]} (#{play[:doc_count]} lines) are:"
      speakers = play[:speakers][:buckets]
      for speaker <- speakers do
        IO.puts "#{speaker[:key]} - apearing #{speaker[:doc_count]} times"
      end
    end

  end

  def getPieceText(piece) do

    queryLines = search [index: "shakespeare"] do
      size 100
      query do
        bool do
          must do
            match "play_name", "#{piece}"
          end
        end
      end
      sort do
        [
          [line_id: "asc"]
        ]
      end
    end

    {:ok, code, lines} = Tirexs.Query.create_resource(queryLines)

    linesInfo = lines[:hits][:hits]
    Enum.each linesInfo, fn(lineInfo) -> IO.puts "#{lineInfo[:_source][:text_entry]}"  end

  end

end
