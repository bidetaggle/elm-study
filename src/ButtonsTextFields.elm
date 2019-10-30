module ButtonsTextFields exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, input, Attribute, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
  { n : Int
  , step : Int
  }

init : Model
init =
  { n = 0
  , step = 1
  }

-- UPDATE

type Msg
  = Increment Int
  | Decrement Int
  | Reset
  | ChangeStep String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment step -> { model | n = model.n + model.step }
    Decrement step -> { model | n = model.n - model.step }
    Reset -> init
    ChangeStep newStep -> { model | step = Maybe.withDefault 0 <| String.toInt newStep }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "incrementation step", value (String.fromInt model.step), onInput ChangeStep ] []
    , button [ onClick (Decrement 2) ] [ text "-" ]
    , div [] [ text (String.fromInt model.n) ]
    , button [ onClick (Increment 3) ] [ text "+" ]
    , button [ onClick Reset ] [ text "reset" ]
    ]
