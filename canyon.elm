
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
    
    ,

    [ treeTwo 
    , shrubTwo
    , snowTwo
    , outcroppingTwo
    , distanceTwo
    ]

    ,

    [ treeThree
    , shrubThree
    , outcroppingThree
    , distanceThree
    ]

    ,

    [ shrubFour
    , outcroppingFour
    , distanceFour
    ]

    , 

    [ distanceFive
    ]
  ]

distanceFive : Terrain
distanceFive =
  { top = round (height / 2)
  , right = round (width / 2)
  , left = round (-width / 2)
  , bottom = round (-height / 2)
  , script =
    [ "You still don't know what it is."
    , "If you listen to your body, you can hear it singing."
    , "If you listen to your body, you can feel it squirming."
    , "It you listen to your body, you can want what it wants."
    , "If you listen to your body, you can exist in space and time."
    , "If you listen to your body, you can develop a relationship with it."
    , "If you listen to your body, you can learn about yourself."
    , "If you listen to your body, you can find your true memories."
    , "If you listen to your body, you can change."
    , "If you listen to your body, you can stop changing."
    , "If you listen to your body, you can move."
    , "If you listen to your body, you can stop moving."
    , "If you listen to your body, you can love it."
    , "If you listen to your body, you can hear that it loves you."
    , "You listen to your body, you can hear that it loves you."
    , "Listen to your body, you can hear that it loves you."
    , "To your body, you can hear that it loves you."
    , "Your body, you can hear that it loves you."
    , "Body, you can hear that it loves you."
    , "You can hear that it loves you."
    , "Hear that it loves you."
    , "It loves you."
    , "I love you."
    , "I love you."
    , "I love you."
    , "I love you."
    , "I love you."
    , "I love you."
    , "I love you."
    , "I love you?"
    ]
  , line = 0
  }


shrubFour : Terrain
shrubFour =
  { top = theShrub.top
  , right = theShrub.right
  , left = theShrub.left
  , bottom = theShrub.bottom
  , script = 
    [ "Here you are."
    , "No more defenses."
    , "Nothing to hold onto."
    , "What does that make you?"
    , "Where are your roots now?"
    , "Where will you find water?"
    , "Where will you find shelter?"
    , "Who will love you?"
    , "Who will protect you?"
    , "Who will tell you you're not alone?"
    , "Will you be alone?"
    , "Will you be forgotten?"
    , "Will you be crushed?"
    , "Will you be eaten alive?"
    , "Will you be treated badly?"
    , "Will you be taken advantage of?"
    , "Will you be attacked?"
    , "Will you be damaged?"
    , "Will you be frustrated?"
    , "Will you begin to lose hope?"
    , "Will you begin to forget what it was like?"
    , "Will you begin to forget what you need?"
    , "Will you begin to forget where your body begins and ends?"
    , "Will you begin to forget who made you this way?"
    , "Will you begin to forget your own name?"
    , "What is your name?"
    ]
  , line = 0
  }

outcroppingFour : Terrain
outcroppingFour =
  { top = theOutcropping.top
  , right = theOutcropping.right
  , left = theOutcropping.left
  , bottom = theOutcropping.bottom
  , script = 
    [ "I'll be going soon."
    , "There's no more use for me here."
    , "You've outgrown me."
    , "I can't say I'm surprised."
    , "But I am a little sad."
    , "You see..."
    , "This whole time I've been pushing you to leave, right?"
    , "But actually I just wanted you to reassure me."
    , "I'm going to be sad when you're gone."
    , "I'm going to be sad when you vanish forever."
    , "I'm going to be sad when you never call."
    , "I'm going to be sad when you never write."
    , "I'm going to be sad when you don't talk about me."
    , "I'm going to be sad when you don't think about me."
    , "I'm going to be sad when you remember the pain I caused you."
    , "I'm going to be sad when you remember me as a villain."
    , "I wanted to be your friend."
    , "I wanted to show you what the world was like."
    , "But you were too afraid."
    , "Or maybe I was."
    , "I forget which of us is me, and which is you."
    , "It doesn't matter now."
    , "Goodbye."
  ]
  , line = 0
  }

distanceFour : Terrain
distanceFour =
  { top = theDistance.top
  , right = theDistance.right
  , left = theDistance.left
  , bottom = theDistance.bottom
  , script =
    [ "..."
    , "....."
    , "......"
    , "............."
    , ".........................."
    , "You're sure?"
    , "..........................."
    , "............"
    , "Of course you're not sure."
    , "Who could possibly be sure until they've seen the whole picture?"
    , "Who could possibly see the whole picture until they've lived it?"
    , "How can you consent to an abstraction?"
    , "Your fears are an abstraction."
    , "Your self is an abstraction."
    , "Your memories are an abstraction."
    , "Your attachments are an abstraction."
    , "Your family is an abstraction."
    , "Your love is an abstraction."
    , "Your love is an abstraction."
    , "Your love is an abstraction."
    , "Your love is absurd."
    , "Your love has no basis in reality."
    , "Your love is meaningless."
    , "Your love is empty."
    , "Your love is gone as soon as you leave the room."
    , "Your love is as deadly as you are."
    , "Your love is poison."
    , "Regret yourself."
    , "Hold the pain of your own existence deep within your heart."
    , "Experience your own suffering."
    , "Know how richly, deeply, intensely wrong your whole being is."
    , "Leap."
    ]
  , line = 0
  }

treeThree : Terrain
treeThree =
  { top = theTree.top
  , right = theTree.right
  , left = theTree.left
  , bottom = theTree.bottom
  , script =
    [ "Despite everything, the sky is still blue around Blue Sky Tree."
    , "You remember the first time you saw that tree."
    , "At least, you think you do."
    , "Sometimes, when you look back on stuff like that, it kind of blurs."
    , "Like... like you're not ready to see it all at once."
    , "But you know how fond you've always been of that blue sky."
    , "Nothing can take that away."
    , "Not even a weird green pulsating light that seems to be eating away at the fabric of reality itself."
    , "Or, like, chainsaws even."
    , "Chainsaws would just break."
    , "Air pollution also."
    , "Yup."
    , "Blue Sky Tree stands strong, no matter what."
    , "That's the rules."
    , "You've always been able to count on this world to behave in a very particular way."
    , "And, in exchange, the world has made very specific, stable, demands of you."
    , "If you want to find water, plant your roots exactly here and dig deep."
    , "Do not more, if you value your life."
    , "Do not try to be anything more than what you are."
    , "And, as long as that remains, the blue sky will be there."
    , "No matter what the weather is, you can always look up to Blue Sky Tree and see blue sky."
    , "It's going to be important that you remember that."
    , "You know."
    , "When........"
    , "Never mind."
    ]
  , line = 0
  }

shrubThree : Terrain
shrubThree =
  { top = theShrub.top
  , right = theShrub.right
  , left = theShrub.left
  , bottom = theShrub.bottom
  , script =
    [ "This is you."
    , "This is you."
    , "This is you."
    , "This is you."
    , "This is you."
    , "This is you."
    , "This is you."
    , "This is you?"
    ]
  , line = 0
  }

outcroppingThree : Terrain
outcroppingThree =
  { top = theOutcropping.top
  , right = theOutcropping.right
  , left = theOutcropping.left
  , bottom = theOutcropping.bottom
  , script =
    [ "Now or never, friendo."
    , "There's not much more to see."
    , "The canyon has been entirely consumed with whatever that glowing green static pretends to be."
    , "Are you gonna pretend it's not there now?"
    , "Just like you pretended Trans Canyon wasn't real this whole time?"
    , "Is that going to be your legacy?"
    , "Here Lies A Random Shrub"
    , "It Didn't Particularly Matter To Anyone"
    ]
  , line = 0
  }

distanceThree : Terrain
distanceThree =
  { top = theDistance.top
  , right = theDistance.right
  , left = theDistance.left
  , bottom = theDistance.bottom
  , script =
    [ "It seems alive, at least."
    , "Like..."
    , "There are so many mechanistic horrors in this world."
    , "Too many."
    , "This thing..."
    , "Whatever it is......"
    , "It seems like it would at least be aware of you, if it had to eat you."
    , "It's not a grinding-geared capitalist death machine."
    , "It's not a rock."
    , "It's some weird lightning and maybe... something purple? idk"
    , "I mean..."
    , "Look."
    , "If things aren't the same after..."
    , "There's just..."
    , "You don't have to do this."
    , "You don't have to keep clicking."
    , "You can still turn it all back"
    , "Get the canyon back up in here, go back to the snow, everything."
    , "You don't have to see where it leads."
    , "I mean."
    , "I'm the voice in the darkness that cries out to you"
    , "I'm the part of you screaming in your ear"
    , "JUST DO IT"
    , "TAKE THE LEAP"
    , "FUCKING DO IT ALREADY"
    , "YOUR TIME ON THIS EARTH IS PRECIOUS AND FINITE"
    , "WHAT ARE YOU WAITING FOR"
    , "MAKE THE LEAP"
    , "SEE WHAT'S ON THE OTHER SIDE"
    , "DO IT NOW"
    , "but"
    , "like"
    , "i could be wrong??"
    , "and ultimately"
    , "it has to be your choice."
    , ":)"
    ]
  , line = 0
  }

treeTwo : Terrain
treeTwo = 
  { left = theTree.left
  , top = theTree.top
  , right = theTree.right
  , bottom = theTree.bottom
  , script =
    [ "At least Blue Sky Tree never falters."
    , "The sky is always blue around Blue Sky Tree."
    , "There are no problems here."
    ]
  , line = 0
  }

shrubTwo : Terrain
shrubTwo =
  { left = theShrub.left
  , top = theShrub.top
  , right = theShrub.right
  , bottom = theShrub.bottom
  , script = 
    [ "What are you now, little shrub?"
    , "Little bush?"
    , "Little pipsqueak?"
    , "What does all your hesitation bring you?"
    , "What does a lifetime of waiting at the edge of a fabulous outcropping mean now?"
    , "The cliffs have vanished."
    , "The canyon is not a canyon."
    , "The ominous glyphs in the sky have eaten it."
    , "Maybe they'll eat you next."
    , "What would you do about it if they did?"
    , "Probably nothing."
    , "You're just a shrub."
    ]
  , line = 0
  }

snowTwo : Terrain
snowTwo =
  { left = theSnow.left
  , top = theSnow.top
  , right = theSnow.right
  , bottom = theSnow.bottom
  , script = 
    [ "It's still snowing."
    , "It deserves to snow."
    , "The trees out there deserve to be cold."
    , "They're probably suffering for something that they did."
    , "Like, they didn't sing in church or something."
    , "Or they had sex in the wrong way."
    , "Maybe they just got used to it snowing all the time."
    , "Maybe they just decided to put down roots in a place where it always snows"
    , "and even though they wish it would stop, they can't imagine leaving."
    , "Maybe they didn't listen to their friends telling them they would always be cold."
    , "Maybe they wanted to, but they were just too afraid."
    , "Maybe they were afraid of falling into the abyss."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of dying."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of getting rejected."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid they would never put down roots again."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of never having any friends."
    , "Maybe they were afraid of being rejected by their family."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of people abusing them."
    , "Maybe they were afraid of people mistreating them."
    , "Maybe they were afraid of falling into Trans Canyon."
    , "Maybe they were afraid of people being buttheads to them."
    , "Maybe they were afraid of being buttheads to people."
    , "Maybe they were afraid of their own butts."
    , "Maybe they were afraid of their own heads."
    , "Maybe they were afraid of their own soft spots."
    , "Maybe they were afraid of their own needs."
    , "Maybe they were afraid of their own roots."
    , "Maybe they were afraid of their own branches."
    , "Maybe they were afraid of their own bodies."
    , "Maybe they were afraid of their own pain."
    , "It's still snowing."
    , "It's cold."
    ]
  , line = 0
  }

outcroppingTwo : Terrain
outcroppingTwo =
  { top = theOutcropping.top
  , right = theOutcropping.right
  , left = theOutcropping.left
  , bottom = theOutcropping.bottom
  , script =
    [ "You can feel it, can't you?"
    , "Reality is coming undone."
    , "The sky it turned to orange, pink, and violet"
    , "Like it hadn't before."
    , ";)"
    , "I'm just kiddin'."
    , "That's a green sky if I've ever seen one."
    , "Looks like it's laced with some kinda magic lightning??"
    , "Actually I don't know if that's even a sky."
    , "Actually I don't know what's going on."
    , "Have you considered maybe going to get a closer look?"
    ]
  , line = 0
  }

distanceTwo : Terrain
distanceTwo = 
  { top = theDistance.top
  , right = theDistance.right
  , left = theDistance.left
  , bottom = theDistance.bottom
  , script =
    [ "You're not sure what you're looking at, but it's definitely in pain."
    , "Your brain whispers a secret."
    , "Four is the number of negation."
    , "Something is trying to dispel an enchantment."
    , "If the enchantment is dispelled, will you still have your outcropping?"
    , "Will you still have your friends?"
    , "Will your parents still love you?"
    , "Will you ever find a committed relationship?"
    , "Will you be able to survive on your own?"
    , "Will you be able to live in the world?"
    , "Are you going to be okay?"
    , "Are you going to be okay?"
    , "Are you going to be okay?"
    , "Are you going to be okay?"
    , "Are you going to be okay?"
    ] 
  , line = 0
  }

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
  { model | story = model |> updatedStory }



updatedStory : Model -> List Scene
updatedStory model =
  List.indexedMap (updatedScene (model.scene) (currentTerrain model)) model.story

updatedScene : Int -> Terrain -> Int -> Scene -> Scene
updatedScene number terrain index scene =
  if number == index then
    List.indexedMap (updatedTerrain terrain) scene
  else
    scene


updatedTerrain : Terrain -> Int -> Terrain -> Terrain
updatedTerrain reality index candidate =
  if (List.length candidate.script) == (List.length reality.script) then
    { candidate | line = candidate.line + 1 }
  else
    candidate


currentScene : Model -> Scene
currentScene model =
  model.story
  |> List.drop (model.scene - 1)
  |> List.head
  |> Maybe.withDefault []

currentTerrain : Model -> Terrain
currentTerrain model =
  model
  |> currentScene
  |> (terrainAt (toElmCoordinatesInt model.focus))





canProgress : Model -> Bool
canProgress model =
  textOf model == defaultString

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
  model
  |> currentScene
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