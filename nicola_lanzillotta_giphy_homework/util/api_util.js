export const fetchSearchGiphys = searchTerm => (
    $.ajax({
        method: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=3k3DA7iKxITHdmSbUT7zT3yeYmfSt0b8&limit=2`,
    })
)