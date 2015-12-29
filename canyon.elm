
import Html exposing (..)
import Signal exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
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
  collage 3504 2554
    [ (model |> picture |> toForm)
    , (model |> textAt (0, 1) |> show |> toForm |> scale 10)
    ]
  |> fromElement

picture : Model -> Element
picture model =
    image 3504 2554 ("Trans Canyon " ++ (toString model) ++ ".jpg")

textAt : (Int, Int) -> Model -> String
textAt (x, y) model =
  if x < y then
    "Fix the world."
  else
    "Now."

--MAIN


main : Signal Html
main =
  Signal.map (view address)
    (Signal.foldp update init actions)

--FIX THE WORLD