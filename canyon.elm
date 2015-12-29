
import Html exposing (..)
import Signal exposing (..)
import Graphics.Element exposing (..)

--MODEL

type alias Model = Int

init : Model
init =
  1

--UPDATE

type Action = NoOp
  | Progress

update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model
    Progress -> model + 1


actionMailbox : Mailbox Action
actionMailbox =
  Signal.mailbox NoOp

address : Address Action
address =
  actionMailbox.address

actions : Signal Action
actions =
  actionMailbox.signal

--VIEW

view : Address Action -> Model -> Html
view address model =
  image 3504 2554 ("Trans Canyon " ++ (toString model) ++ ".jpg")
  |> fromElement

--MAIN


main : Signal Html
main =
  Signal.map (view address)
    (Signal.foldp update init actions)

--FIX THE WORLD