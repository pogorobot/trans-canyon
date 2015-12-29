
import Html exposing (..)
import Signal exposing (..)
import Graphics.Element exposing (..)
import Mouse

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
    Progress -> progress model

progress : Model -> Model
progress model =
  if model < 5 then
    model + 1
  else
    model


actionMailbox : Mailbox Action
actionMailbox =
  Signal.mailbox NoOp

address : Address Action
address =
  actionMailbox.address

actions : Signal Action
actions =
  progressOnClick

progressOnClick : Signal Action
progressOnClick =
  Signal.map clickMapper Mouse.clicks

clickMapper : () -> Action
clickMapper click =
  Progress

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