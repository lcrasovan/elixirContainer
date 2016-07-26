defmodule ApplicationTwo do
  import Tirexs.Search

  def getTitles do

      query = search [index: "shakespeare"] do
        size 0
        aggs do
          play_names do
            terms field: "play_name", size: 100
          end
        end
      end

      {:ok, code, aggregations} = Tirexs.Query.create_resource(query)

      IO.puts "Shakespeare pieces:\n"

      playsInfo = aggregations[:aggregations][:play_names][:buckets]

      Enum.each playsInfo, fn(playInfo) -> IO.puts(playInfo[:key]) end

  end

end
