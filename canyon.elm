
import Html exposing (..)
import Signal exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse

--MODEL

type alias Model = 
  { story : List Scene
  , scene : Int
  , focus : (Int, Int)
  }

type alias Scene = List Terrain

type alias Terrain =
  { left : Int
  , top : Int
  , right : Int
  , bottom : Int
  , script : List String
  , line : Int
  }

init : Model
init =
  { story = canyonStory
  , scene = 1
  , focus = (0, 0)
  }

canyonStory : List Scene
canyonStory =
  [
    [ theTree
    , theShrub
    , theSnow
    , theCliffs
    , theSteam
    , theOutcropping
    , theDistance
    , theVoid
    ]
  ]

theTree : Terrain
theTree =
  { left = -2000
  , top = 2000
  , right = 0
  , bottom = 0
  , script =
    [ "That's Blue Sky Tree!"
    , "For some reason, the sky is always blue around Blue Sky Tree"
    , "No matter what the weather looks like outside!"
    , "One time, you asked the tree how she kept the sky so blue"
    , "The tree looked very grave,"
    , "stroked her long white beard,"
    , "and answered."
    , "It is because of what we are made of,"
    , "said the tree,"
    , "Out of this mere earth."
    ]
  , line = 0
  }

theShrub : Terrain
theShrub =
  { left = -200
  , top = 200
  , right = 200
  , bottom = -200
  , script =
    [ "That's you!"
    , "You are a shrub."
    , "It's not a glamorous life, but it's yours."
    , "You've been living all your life looking out upon glorious Trans Canyon."
    , "Not that you're trans, yourself."
    , "You're just, looking over it."
    , "You know."
    , "Planted there."
    , "Anyway there's spikes and it's dry and you're probably not even interested."
    , "Whatever."
    , "Who cares."
    ]
  , line = 0
  }
theSnow : Terrain
theSnow =
  { left = 0
  , top = 750
  , right = 2000
  , bottom = 200
  , script =
    [ "Sometimes it snows in the distance."
    , "Never up close."
    , "How could snow get up close? That would be like..."
    , "Like water on the sun"
    , "Like a rainbow on a clear day"
    , "Like fog rising up out of nowhere and enveloping us all"
    , "Like acid dissolving through a complicated series of self-deceptions and lies"
    , "Like cutting through a hedge maze with a chainsaw"
    , "Like being a vampire and forgetting your sunscreen"
    , "Like raaaaain on your wedding day"
    , "Like a spider greeting you as a friend and ally"
    , "Anyway it never snows up close."
    , "Just in the distance."
    , "It's always snowing in the distance..."
    ]
  , line = 0
  }

theCliffs : Terrain
theCliffs =
  { left = -500
  , top = 600
  , right = 2000
  , bottom = 200
  , script = 
    [ "The setting sun shines red on the cliffs across the canyon."
    , "They are real cliffs."
    , "It is really sunset."
    , "You're pretty sure that everything you see and think and feel and believe is 100% fresh-cut Reality."
    , "You're really totally pretty sure of that."
    , "It's not a lie at all."
    ]
  , line = 0
  }

theSteam : Terrain
theSteam =
  { left = -50
  , top = 250
  , right = 300
  , bottom = 0
  , script =
    [ "Steam is always rising from the bottom of Trans Canyon."
    , "You're not sure what's boiling down there."
    , "Maybe it's a geothermal vent."
    , "Maybe it's a lake of acid."
    , "Maybe it's the breath of a giant slobbering slime monster."
    , "Maybe it's a reservoir of societal expectations."
    , "Maybe it's just a social construct."
    , "Maybe it's a bunch of cops with their guns out."
    , "Maybe there's a huge party down there."
    , "Maybe it's a sex party."
    , "Maybe it's memories."
    , "You're not really sure."
    ]
  , line = 0
  }

theOutcropping : Terrain
theOutcropping =
  { left = -2000
  , top = 0
  , right = 2000
  , bottom = -2000
  , script =
    [ "This outcropping has been your home as long as you can remember."
    , "You can't.. actually... remember that far back."
    , "Or, really, anything."
    , "You're a shrub??"
    , "It just.. I mean, I don't mean to speak ill of you."
    , "I just don't really see where you would store memories. I mean you don't even have much of a root system, or, like, a body."
    , "You're not just a shrub, you're a bad shrub."
    , "You can't even just sit there right."
    , "What are you even doing here, really?"
    , "Just existing."
    , "Just continuing to exist."
    , "Fuck you."
    , "Okay?"
    , "Fuck you."
    , "Look, you have this gorgeous outcropping looking out over all of beautiful Trans Canyon."
    , "What do you do with it?"
    , "Fucking nothing."
    , "EVER."
    , "Not even once in the ... amount of time you've been alive have you even looked down there."
    , "Other shrubs live down there, you know?"
    , "They LIVE down there."
    , "They live where it's dark and cold and scary and depressing and there's no food and there's no water and there's no shelter and everybody thinks it's your fault."
    , "But not you!"
    , "Nooooooo, you're special."
    , "You're a special shrub, who's not even gonna peek over the edge."
    , "No matter how much you want to."
    , "You're too scared."
    , "You're too cowardly."
    , "You're too devoted to your own existence."
    , "Your survival instinct is a weakness."
    , "Go look."
    ]
  , line = 0
  }

theDistance : Terrain
theDistance =
  { left = -100
  , top = 2000
  , right = 2000
  , bottom = 1600
  , script =
    [ "Something doesn't make sense."
    , "You could swear the sun was setting."
    , "That looks like... green and purple lightning."
    , "That looks like... the Slime Queen returning to extract her revenge."
    , "That looks like... forgetting your best friend's name."
    , "That looks like... the sky blushed, and then got really angry."
    , "That looks like... somebody forgot to dry out the universe."
    , "That looks like... animorphic lenses may be necessary."
    , "That looks like... a gay robot making out with a frying pan."
    , "That looks like... throwing yourself in the dumpster and crying."
    , "That looks like... the lid to the toy box forever closing shut."
    , "That looks like... giraffes eating root vegetables because the acacia trees were cut down."
    , "That looks like... a zoo trip."
    , "That looks like... a freak show."
    , "That looks like... a colossal misdrop."
    , "That looks like... the biggest regret you ever had in your life."
    , "That looks like... the worst nickname you ever heard."
    , "That looks like... a starving child at Thanksgiving."
    , "That looks like... a dinner feast, crawling with spiders."
    , "That looks like... a web."
    , "That looks like... ........"
    , "That looks like... maybe I'll eat you last."
    , "That looks like... you can't trust your own mother."
    , "That looks like... you can't trust your own perceptions."
    , "That looks like... you can't trust your own body."
    , "That looks like... you can't trust your own memories."
    , "That looks like... you can't trust your own decisions."
    , "That looks like... you can't trust your own judgment."
    , "That looks like... you can't trust your own defenses."
    , "That looks like... you can't trust your own dissociation."
    , "That looks like... you can't trust the land."
    , "That looks like... you can't trust the air."
    , "That looks like... you can't trust the water."
    , "That looks like... you can't trust the flame."
    , "That looks like... there is nothing else."
    , "That looks like... you are staring into the Abyss."
    , "That looks like... you are staring into the Unknown."
    , "That looks like... you are staring into the Darkness."
    , "That looks like... you are staring into the Distance."
    , "That looks like..."
    , "That looks like..."
    , "That looks like..."
    , "That looks like a self-portrait."
    ]
  , line = 0
  }

theVoid : Terrain
theVoid = 
  { left = 0
  , top = 0
  , right = 0
  , bottom = 0
  , script =
    [ "You shouldn't be here."
    , "You don't belong here."
    , "You shouldn't be here."
    , "You don't belong here."
    , "You shouldn't be here."
    , "You don't belong here."
    , "You shouldn't be here."
    , "You shouldn't be here."
    , "You don't belong here."
    , "You shouldn't be here."
    , "You don't belong here."
    , "You shouldn't be here."
    , "You don't belong here."
    ]
  , line = 0
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
  if (model |> canProgress) then
    { model | scene = model.scene + 1 }
  else
    pageTurn model

pageTurn : Model -> Model
pageTurn model =
  { model | story = model |> nextLine }

nextLine : Model -> List Scene
nextLine model =
  List.map (sceneUpdate (currentScene model) (currentTerrain model)) model.story

sceneUpdate : Scene -> Terrain -> Scene -> Scene
sceneUpdate roots terrain branches =
  if roots == branches then
    List.map (terrainUpdate terrain) roots
  else
    roots

terrainUpdate : Terrain -> Terrain -> Terrain
terrainUpdate candidate reality =
  if candidate == reality then
    { candidate | line = candidate.line + 1 }
  else
    candidate


currentScene : Model -> Scene
currentScene model =
  model.story 
  |> List.take model.scene 
  |> List.head
  |> Maybe.withDefault []

currentTerrain : Model -> Terrain
currentTerrain model =
  model
  |> currentScene
  |> (terrainAt (toElmCoordinatesInt model.focus))





canProgress : Model -> Bool
canProgress model =
  model.focus |> atTheCenter

atTheCenter: (Int, Int) -> Bool
atTheCenter (x, y) =
  x < 50 && y < 50 && x > -50 && y > -50

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

width : Float
width =
  3504

height : Float
height =
  2554

view : Address Action -> Model -> Html
view address model =
  collage (floor width) (ceiling height)
    [ (model |> picture |> toForm)
    , (model |> textOf |> show |> toForm |> hover model.focus)
    ]
  |> fromElement


toElmCoordinates : (Int, Int) -> (Float, Float)
toElmCoordinates (x, y) =
  ( (toFloat x) - width / 2
  , height / 2 - (toFloat y)
  )

toElmCoordinatesInt : (Int, Int) -> (Int, Int)
toElmCoordinatesInt (x, y) =
  ( x - round (width / 2)
  , round (height / 2) - y
  )

picture : Model -> Element
picture model =
  image 3504 2554 ("Trans Canyon " ++ (toString model.scene) ++ ".jpg")

textOf : Model -> String
textOf model =
  model.story 
  |> List.take model.scene 
  |> List.head
  |> Maybe.withDefault []
  |> (lineAt (toElmCoordinatesInt model.focus))

lineAt : (Int, Int) -> Scene -> String
lineAt (x, y) scene =
  List.filter (withinBounds (x, y)) scene
  |> List.map getLine
  |> List.head
  |> Maybe.withDefault defaultString

terrainAt : (Int, Int) -> Scene -> Terrain
terrainAt (x, y) scene =
  (List.filter (withinBounds (x, y)) scene)
  |> List.head
  |> Maybe.withDefault theVoid

defaultString : String
defaultString =
  "You're not sure what you're looking at."

scriptOf : Scene -> String
scriptOf scene =
  List.map monologueOf scene
  |> List.foldr (++) ""

monologueOf : Terrain -> String
monologueOf terrain =
  terrain.script
  |> List.foldr (++) ""

getLine : Terrain -> String
getLine terrain =
  terrain.script
  |> List.drop terrain.line
  |> List.head
  |> Maybe.withDefault defaultString
  --terrain.line
  --|> toString
  --terrain.script 
  --|> List.drop terrain.line 
  --|> List.head 
  --|> Maybe.withDefault defaultString

withinBounds : (Int, Int) -> Terrain -> Bool
withinBounds (x, y) landmark =
  x > landmark.left && x < landmark.right && y < landmark.top && y > landmark.bottom



hover : (Int, Int) -> Form -> Form
hover (x, y) =
  (x, y)
  |> toElmCoordinates
  |> move

--MAIN


main : Signal Html
main =
  Signal.map (view address)
    (Signal.foldp update init actions)

--FIX THE WORLD