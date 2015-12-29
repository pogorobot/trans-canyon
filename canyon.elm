
import Html exposing (..)
import Signal exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse

--MODEL

type alias Model = 
  { scene : Int
  , focus : (Int, Int)
  }

init : Model
init =
  { scene = 1
  , focus = (0, 0)
  }

--UPDATE

type Action = NoOp
  | Progress
  | Spotlight (Int, Int)

update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model
    Progress -> progress model
    Spotlight focus -> spotlight focus model

progress : Model -> Model
progress model =
  if model.scene < lastScene then
    { model | scene = model.scene + 1 }
  else
    model

lastScene : Int
lastScene =
  5

spotlight : (Int, Int) -> Model -> Model
spotlight (x, y) model =
  { model | focus = (x, y) }

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
  Signal.merge 
    (Signal.map clickMapper Mouse.clicks)
    (Signal.map arrowMapper Mouse.position)

clickMapper : () -> Action
clickMapper click =
  Progress

arrowMapper : (Int, Int) -> Action
arrowMapper (x, y) =
  Spotlight (x, y)

--VIEW

view : Address Action -> Model -> Html
view address model =
  collage 3504 2554
    [ (model |> picture |> toForm)
    , (model |> textOf |> show |> toForm |> scale 10)
    ]
  |> fromElement

picture : Model -> Element
picture model =
    image 3504 2554 ("Trans Canyon " ++ (toString model.scene) ++ ".jpg")

textOf : Model -> String
textOf model =
  textAt model.focus

textAt : (Int, Int) -> String
textAt (x, y) =
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