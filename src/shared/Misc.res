let truncateInMiddle = (string: string, targetLength) => {
    let joinWith = "..."
    let length = Js.String.length(string)
    let chars = string
        |> Js.String.split("")

    let firstHalf = chars
        |> Js.Array.slice(
            ~start = 0, 
            ~end_ = targetLength / 2
        )

    let secondHalf = chars
        |> Js.Array.slice(
            ~start = length - (targetLength / 2), 
            ~end_ = length
        )

    let truncated = 
        Js.Array.joinWith("", firstHalf)
        ++ joinWith
        ++ Js.Array.joinWith("", secondHalf)

    truncated
}