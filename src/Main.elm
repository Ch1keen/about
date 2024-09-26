module Main exposing (..)

import Browser
import Html exposing (Html, div, text, hr, p, a, h1, h2, ul, li, img, span)
import Html.Attributes exposing (class, style, href, src, width, height)

-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
    Int


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


sectionStyle : List (Html.Attribute Msg)
sectionStyle =
    [ style "margin" "0 auto" ]


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


ch1keenTitle : Html Msg
ch1keenTitle =
    div
        [ style "padding-top" "48px", style "padding-bottom" "24px" ]
        [ h1 [ style "text-align" "center" ] [ text "Han Jeongjun" ]
        , contactLine (text "\u{1f4e7}") "mailto:hire-me@ch1keen.xyz" "hire-me@ch1keen.xyz"
        , contactLine (img [ src "assets/github-mark.svg", width 24, height 24 ] []) "https://github.com/Ch1keen" "github.com/Ch1keen"
        ]


section : String -> Html Msg -> Html Msg
section title body =
    div
        [ style "margin" "0 auto", style "margin-top" "5rem", style "margin-bottom" "5rem" ]
        [ h2 [] [ text title ], divider, body ]


ch1keenProfile : Html Msg
ch1keenProfile =
    section "Profile"
        (p []
            [ text "Highly motivated and team-friendly individual with diverse experiences in programming, cybersecurity, and collaborative projects. Proficient in various programming languages, frameworks, and tools. Experienced in leading teams and contributing to open-source projects." ])


ch1keenCareer : Html Msg
ch1keenCareer =
    section "Career"
        (ul []
            [ li []
                [ text "2023.10 - present: Red Team, AutoCrypt"
                , ul []
                    [ li [] [ text "Led V2X (Vehicle-to-Everything) testing, focusing on CAM/DENM and BSM functionalities. Specialized in reverse engineering V2X communication services and developing test plans." ]
                    , li [] [ text "Contributed to RDW authentication efforts of an In-Vehicle Infotainment (IVI) hardware, enhancing security protocols." ]
                    , li [] [ text "Authored a concise report on Automobile Hacking, improving internal understanding of key vulnerabilities." ]
                    ]
                ]
            , li []
                [ text "2020.10 - 2021.02: Application Developer Intern, Petner"
                , ul []
                    [ li [] [ text "Developed community service using Flutter framework." ]
                    , li [] [ text "Integrated user location tracking and remote camera sharing services using WebRTC." ]
                    ]
                ]
            , li []
                [ text "2019.03 - 2020.10: CERT Team, Republic of Korea Army"
                , ul []
                    [ li [] [ text "Led a CERT squad, managing team members and executing missions." ]
                    , li [] [ text "Handled cyber security incidents across multiple divisions." ]
                    ]
                ]
            , li []
                [ text "2021.01 - 2022.06: Undergraduate Researcher, Kyonggi University NSE Lab"
                , ul []
                    [ li [] [ text "Researched blockchain technologies and security vulnerabilities." ]
                    , li [] [ text "Studied security flaws in Ethereum dApps and coin economics." ]
                    ]
                ]
            , li []
                [ text "Key Projects"
                , ul []
                    [ li [] [ text "Automobile Hacking Report (2024): Authored a report on automobile cybersecurity focusing on modern ECU vulnerabilities." ]
                    , li [] [ text "The Dia programming language (2024): A functional programming language focused on portability and creating statically compiled binary." ]
                    , li []
                      [ text "The "
                      , a [ href "https://wiki.ch1keen.xyz/" ] [ text "Ch1keen Wiki" ]
                      , text "(2023): Maintaining a web site about cybersecurity and collected notable tips." ]
                    , li [] [ text "DevSecOps Container Security Platform (2022): Contributed to a platform integrating image signing and vulnerability scanning in CI/CD pipelines." ]
                    , li [] [ text "NFT Trading Platform (2021): Led a team of 11 to develop a secure NFT trading platform." ]
                    , li [] [ text "Flutter-based Community Service (2020): Developed an app with location tracking and remote camera functionalities." ]
                    ]
                ]
            ])


ch1keenAward : Html Msg
ch1keenAward =
    section "Awards and Recognitions"
        (ul []
            [ li [] [ text "4th Place, Def Con Car Hacking Village (2024)"
                    , ul []
                        [ li [] [ text "Collaborated with the AutoCrypt Red Team, focusing on RAMN challenges." ]
                        , li [] [ text "Provided reverse engineering insights and identified necessary tools for challenge solutions." ]
                        , li [] [ text "Facilitated team communication with event staff to obtain critical hints and guidance." ]
                        ]
                    ]
            , li [] [ text "2023 Brainhack CDDC 2023 CTF (Singapore) - Final 20th Place" ]
            , li [] [ text "2023 Hacktheon Sejong (Korea) - Final 21th Place" ]
            , li [] [ text "2021 KOSPO Web Security Competition - Encouragement Award" ]
            , li [] [ text "2020 TS Security Competition 'Find Security holes' - Excellence Award" ]
            , li [] [ text "Blood Donation Merit Award (Silver)" ]
            ])


ch1keenEducation : Html Msg
ch1keenEducation =
    section "Education & Training"
        (ul []
            [ li [] [ text "2023.02: Global Cyber Security 2023 in Singapore" ]
            , li [] [ text "2022.06 - 2023.03: Best of the Best 11th - Vulnerability Analysis Track" ]
            , li []
                [ text "2017.03 - 2023.02: Kyonggi University"
                , ul []
                    [ li [] [ text "Bachelor of Convergence Security" ]
                    , li [] [ text "Bachelor of Electronics Engineering" ]
                    , li [] [ text "(GPA: 3.91/4.5)" ]
                    ]
                ]
            ])


ch1keenCertificate : Html Msg
ch1keenCertificate =
    section "Certifications"
        (ul []
            [ li [] [ text "Forth Class Amateur Radio Operator (Korea)" ]
            , li [] [ text "SQL Developer (SQLD)" ]
            , li [] [ text "Information Processing Engineer (정보처리기사)" ]
            ])


ch1keenVolunteer : Html Msg
ch1keenVolunteer =
    section "Volunteer Experience"
        (ul []
            [ li []
                [ text "BoB Alumni Council"
                , ul []
                    [ li [] [ text "Active member of the council, contributing to organizing workshops and alumni events." ]
                    , li [] [ text "Promoted cybersecurity education and awareness among university students." ]
                    ]
                ]
            , li []
                [ text "State Of Origin CTF 2023"
                , ul []
                    [ li [] [ text "Volunteered as a challenge creator and organizer for a CTF competition, providing participants with unique and engaging challenges." ]
                    , li [] [ text "Supported the event with technical and logistical assistance, ensuring a smooth experience for all participants." ]
                    ]
                ]
            , li []
                [ text "Ubuntu Asia 2022"
                , ul []
                    [ li [] [ text "Volunteered as a front desk staff at the event, helping to register and assist attendees, including international guests." ]
                    , li [] [ text "Provided logistical support and ensured smooth operation of event activities." ]
                    ]
                ]
            ])


footer : Html Msg
footer =
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
        ]


view : Model -> Html Msg
view model =
    div []
        [ div
            [ class "container" ]
            [ ch1keenTitle
            , ch1keenProfile
            , ch1keenCareer
            , ch1keenAward
            , ch1keenEducation
            , ch1keenCertificate
            , ch1keenVolunteer
            ]
        , hr [ style "border-color" slate_100 ] []
        , footer
        ]

