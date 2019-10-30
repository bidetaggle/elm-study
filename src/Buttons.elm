module Buttons exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model = Int

init : Model
init =
  0

-- UPDATE

type Msg
  = Increment Int
  | Decrement Int
  | Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment step -> model + step

    Decrement step -> model - step

    Reset ->
      init

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick (Decrement 2) ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick (Increment 3) ] [ text "+" ]
    , button [ onClick Reset ] [ text "reset" ]
    ]
