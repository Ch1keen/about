module Main exposing (..)

import Browser
import Html exposing (Html, button, div, span, img, text, hr, p, a, h1, h2, ul, li)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, href, src, width, height)



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
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


-- STYLE
-- A collection of lists for reproducibility

footerStyle : List (Html.Attribute Msg)
footerStyle = [ style "color" slate_300, style "text-align" "center" ]

slate_100 : String
slate_100 = "rgb(241 245 249)"

slate_300 : String
slate_300 = "rgb(203 213 225)"

slate_400 : String
slate_400 = "rgb(148 163 184)"

sectionStyle : List (Html.Attribute Msg)
sectionStyle = [ style "margin" "0 auto" ]

-- VIEW

strip : Html Msg
strip =
  div
    [ style "height" "8px"
    , style "background-color" slate_400
    ] []

divider : Html Msg
divider = hr [ style "border-color" slate_300 ] []

contactLine : Html Msg -> String -> String -> Html Msg
contactLine title url label = p
    [ style "text-align" "center" ]
    [ title
    , span
      [ style "width" "1rem"
      , style "display" "inline-block"] []
    , a [ href url ]
        [ text label ]
    ]

ch1keenTitle : Html Msg
ch1keenTitle =
  div
    [ style "padding-top" "48px"
    , style "padding-bottom" "24px"
    ]
    [ h1 [ style "text-align" "center" ] [ text "Han Jeongjun" ]
    , contactLine
      (text "\u{1f4e7}")
      "mailto:contact@ch1keen.xyz"
      "contact@ch1keen.xyz"
    , contactLine
      (img [ src "assets/github-mark.svg", width 24, height 24 ] [])
      "https://github.com/Ch1keen"
      "github.com/Ch1keen"
    , contactLine
      (img [ src "assets/discord-mark-black.svg", width 24, height 24 ] [])
      "#"
      "ch1keen"
    , p [] [ text "" ]
    ]

section : String -> Html Msg -> Html Msg
section title body =
  div
  [ style "margin" "0 auto"
  , style "margin-top" "5rem"
  , style "margin-bottom" "5rem"
  ]
  [ h2 [] [ text title ]
  , divider
  , body
  ]

ch1keenProfile : Html Msg
ch1keenProfile =
  section "Profile"
    (p []
       [])

ch1keenCareer : Html Msg
ch1keenCareer =
  section "Career"
    (ul
      []
      [ li []
           [ text "2023.10 - present: Red Team, AutoCrypt"
           , ul []
                [ li [] [ text "Performed penetration testings against ECUs, including UDS testings over CAN and Ethernet with understanding of ISO-14229-1" ]
                , li [] [ text "Improved fuzzing library that has been used to perform fuzzing against media libraries and its implementations" ]
                , li [] [ text "Wrote a report article about Automobile Hacking, which was submitted to the Hyundai" ]
                , li [] [ text "Participated teams' efforts about RDW authentication of an ECU" ]
                ]
           ]
      , li []
           [ text "2019.03 - 2020.10: CERT Team, Republic of Korea Army"
           , ul []
                [ li [] [ text "Led a CERT squad as the CERT squad leader, managed team members and followed the CERT team's missions and goals" ]
                , li [] [ text "Identified malicious logs and responded to the cyber security incidences of all divisions of a corps by managing firewalls and Network Access Control systems" ]
                ]
           ]
      ])

ch1keenEducation : Html Msg
ch1keenEducation =
  section "Education"
    (ul
      []
      [ li []
           [ text "2017.03 - 2023.02: Kyonggi University (RPA 3.91 / 4.5)"
           , ul []
                [ li [] [ text "Bachelor of Convergence Security" ]
                , li [] [ text "Bachelor of Electronics Engineering" ]
                ]
           ]
      ])

ch1keenCertificate : Html Msg
ch1keenCertificate =
  section "Certificate"
    (ul [] [])

ch1keenAward : Html Msg
ch1keenAward =
  section "Awards"
    (ul [] [])


footer : Html Msg
footer =
  div
    [ style "margin-top" "5rem"
    , style "margin-bottom" "5rem"]
    [ p footerStyle
      [ text "Gratefully made with "
      , a [ href "https://elm-lang.org/" ] [ text "Elm" ]
      ]
    , p footerStyle
      [ text "Copyright 2024. Ch1keen all rights reserved." ]
    , p footerStyle
      [ text "You can "
      , a [ href "https://github.com/Ch1keen/about" ]
          [ text "browse source code of this resume" ]
      , text "." ]
    ]


view : Model -> Html Msg
view model =
  {- This is the main part of the page, I want to keep it as simple as I can.

  +--------------+
  | strip (thin) |
  +--------------+
  |  |        |  |
  |  | bodies |  |
  |  |        |  |
  |  |        |  |
  +-----(hr)-----+
  |    footer    |
  +--------------+
  -}
  div []
    [ strip
    , div
      [ style "max-width" "45rem"
      , style "margin" "0 auto"
      ]
      [ ch1keenTitle
      , ch1keenProfile
      , ch1keenCareer
      , ch1keenCertificate
      , ch1keenAward
      , ch1keenEducation
      ]
    , hr [ style "border-color" slate_100 ] []
    , footer
    ]

