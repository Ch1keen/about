module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onCheck, onMouseEnter, onMouseLeave)
import List

import ResumeModel exposing (..)
import ResumeKor exposing (..)
import ResumeEng exposing (..)

-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }

init : Context
init =
    { isInteractable = True
    , engVisible = True
    , korVisible = False
    , ctrlerOpacity = "35%"
    }


-- UPDATE

update : Msg -> Context -> Context
update msg context =
    case msg of
        PageStyleToPrintable ->
            { context | isInteractable = False }
        PageStyleToInteractable ->
            { context | isInteractable = True }
        KoreaResumeVisible ->
            { context | korVisible = True }
        KoreaResumeInvisible ->
            if context.engVisible == False
            then context
            else { context | korVisible = False }
        EnglishResumeVisible ->
            { context | engVisible = True }
        EnglishResumeInvisible ->
            if context.korVisible == False
            then context
            else { context | engVisible = False }
        FocusController ->
            { context | ctrlerOpacity = "100%" }
        ZoneOutController ->
            { context | ctrlerOpacity = "35%" }

-- STYLE

footerStyle : List (Html.Attribute Msg)
footerStyle =
    [ style "color" slate_300
    , style "text-align" "center"
    ]


slate_100 : String
slate_100 =
    "rgb(241 245 249)"


slate_300 : String
slate_300 =
    "rgb(203 213 225)"


slate_400 : String
slate_400 =
    "rgb(148 163 184)"



-- VIEW

divider : Html Msg
divider =
    hr [ style "border-color" slate_300 ] []


contactLine : Html Msg -> String -> String -> Html Msg
contactLine title url label =
    p
        [ style "text-align" "center" ]
        [ title
        , span [ style "width" "1rem", style "display" "inline-block" ] []
        , a [ href url ] [ text label ]
        ]


section : String -> Context -> Html Msg -> Html Msg
section title context body =
    if context.isInteractable
    then
        div
            [ style "margin" "5rem auto"
            , style "break-inside" "avoid"
            ]
            [ h2 [] [ text title ], divider, body ]
    else
        div
            [ style "margin" "0 auto"
            , style "break-inside" "avoid"
            ]
            [ h2 [ style "margin-bottom" "2px"] [ text title ], divider, body ]


footer : Context -> Html Msg
footer context =
    if context.isInteractable == True
    then
        div
            [ style "margin-top" "5rem", style "margin-bottom" "5rem"]
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
            , button
                [ onClick PageStyleToPrintable ]
                [ text "Click here to go to the PDF version of the resume." ]
            ]
    else
        div
            [ style "page-break-before" "always"]
            [ p []
                [ text "This page is intended to be printed in a new page. "
                , text "Press Ctrl+P to save the resume in PDF file, and discard this page before downloading." ]
            , p [] [ text "Gratefully made with Elm(https://github.com/elm)." ]
            , p [] [ text "Copyright 2024. Ch1keen all rights reserved." ]
            , p []
                [ text "You can visit "
                , a [ href "https://github.com/Ch1keen/about" ]
                    [ text "https://github.com/Ch1keen/about" ]
                , text " to browse source code of this resume."
                ]
            , button
                [ style "margin-bottom" "1rem", onClick PageStyleToInteractable ]
                [ text "Click here to go back to the web publish version of the resume." ]
            ]



view : Context -> Html Msg
view context =
    div [ (if context.isInteractable then class "pico" else style "font-family" "Times, serif")
        , style "zoom" "87%" ]
        [ div
            [ if context.isInteractable then class "container" else class "" ]
            ((if context.engVisible then
                List.map (\f->f context)
                    [ ch1keenTitle
                    , ch1keenProfile
                    , ch1keenCareer
                    , ch1keenFindings
                    , ch1keenVolunteer
                    , ch1keenAward
                    , ch1keenEducation
                    , ch1keenCertificate
                    ]
            else [])
            ++
            (if context.korVisible then
                List.map (\f->f context)
                    [ ch1keenTitleKor
                    , ch1keenProfileKor
                    , ch1keenCareerKor
                    , ch1keenFindings
                    , ch1keenVolunteerKor
                    , ch1keenAwardKor
                    , ch1keenEducationKor
                    , ch1keenCertificateKor
                    ]
            else []))
        , hr [ style "border-color" slate_100 ] []
        , fieldset
            [ style "position" "fixed"
            , style "width" "240px"
            , style "opacity" context.ctrlerOpacity
            , style "background-color" "white"
            , style "bottom" "10px"
            , style "right" "10px"
            , style "border" ("2px solid " ++ slate_400)
            , style "border-radius" "16px"
            , style "padding" "10px"
            , class "pico"
            , attribute "role" "group"
            , onMouseEnter FocusController
            , onMouseLeave ZoneOutController
            ]
            [ legend [] [ text "Resume Controller" ]
            , label []
                [ input
                    [ name "english"
                    , type_ "checkbox"
                    , checked context.engVisible
                    , onCheck toggleEngPage
                    ] []
                , text "English"
                ]
            , label []
                [ input
                    [ name "korean"
                    , type_ "checkbox"
                    , checked context.korVisible
                    , onCheck toggleKorPage
                    ] []
                , text "한글('Korean')"
                ]
            , label []
                [ input
                    [ name "printable"
                    , type_ "checkbox"
                    , attribute "role" "switch"
                    , checked context.isInteractable
                    , onCheck pageStyleToggle
                    ] []
                , text "Printable / Interactive"
                ]
            ]
        , footer context
        ]

