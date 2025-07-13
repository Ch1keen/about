module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, style, href, src, width, height)
import Html.Events exposing (onClick)

-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias CssStyling =
    Bool


init : CssStyling
init =
    True

-- UPDATE

type Msg
    = TogglePageStyle

update : Msg -> CssStyling -> CssStyling
update msg model = xor True model

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


ch1keenTitle : CssStyling -> Html Msg
ch1keenTitle cssStyling =
    let
        titleStyling =
            if cssStyling
            then [ style "padding-top" "48px", style "padding-bottom" "24px" ]
            else [ ]
    in
        div
            titleStyling
            [ h1 [ style "text-align" "center" ] [ text "Han Jeongjun" ]
            , contactLine (text "\u{1f4e7}") "mailto:hire-me@ch1keen.xyz" "hire-me@ch1keen.xyz"
            , contactLine (img [ src "assets/github-mark.svg", width 24, height 24 ] []) "https://github.com/Ch1keen" "github.com/Ch1keen"
            ]


section : String -> CssStyling -> Html Msg -> Html Msg
section title cssStyling body =
    if cssStyling
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


ch1keenProfile : CssStyling -> Html Msg
ch1keenProfile cssStyling =
    section "Profile" cssStyling
        (div []
            [ p []
                [ text "Highly motivated and team-friendly individual with diverse experiences not only in Automotive penetration testing, but also in web hacking, and collaborative projects. Proficient in various programming languages, frameworks, and tools. Experienced in leading teams and contributing to open-source projects." ]
            , p [] [ strong [] [ text "Keyword: " ]
                , text "Automotive, Penetration Testing, UDS(ISO 14229-1), Cyber Security, UN R.155"
            ]
        ])


ch1keenCareer : CssStyling -> Html Msg
ch1keenCareer cssStyling =
    section "Career" cssStyling
        (ul []
            [ li []
                [ text "2023.10 - present: Automotive Penetration/Security Tester, AutoCrypt Red Team"
                , ul []
                    [ li [] [ text "Performed penetration testing on various ECUs including infortainments, an instrumental cluster, and a telematic ECU, based on the TARA method (ISO/SAE 21434) and discovered possible vulnerabilities on Yocto Linux, QNX, and AUTOSAR based systems." ]
                    , li [] [ text "I reported 11 issues in 5 ECUs. 5 issues were classified as incidents, and reported to CEO of Hyundai Mobis (Problems from Past Projects). It was a collaboration project with Hyundai Mobis." ]
                    , li [] [ text "Led SPI tesing, focusing on sniffing data by connecting exposed SPI lines and dumping data of an exposed SOIC-8 chip on an instrument cluster." ]
                    , li [] [ text "Led V2X (Vehicle-to-Everything) testing, focusing on CAM/DENM and BSM functionalities. Specialized in reverse engineering V2X communication services and developing test plans." ]
                    , li [] [ text "Contributed to Vehicle Type Approval efforts of an In-Vehicle Infotainment (IVI) hardware by ensuring there were no vulnerabilities on CAN/UDS (ISO/SAE 14229-1) and a media player on IVI." ]
                    ]
                ]
            , li []
                [ text "2020.10 - 2021.02: Application Developer Intern, Petner"
                , ul []
                    [ li [] [ text "Developed community service using Flutter and Ruby on Rails frameworks." ]
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
                    [ li [] [ text "The Dia programming language (2024): A functional programming language focused on portability and creating statically compiled binary." ]
                    , li []
                      [ text "The "
                      , a [ href "https://wiki.ch1keen.xyz/" ] [ text "Ch1keen Wiki" ]
                      , text "(2023): Maintaining a web site about cyber security and collected notable tips, written in Next.js." ]
                    , li []
                      -- The Hacking Championship Jr. 2023 (DSEC2023 in Daegu)
                      -- 제9회 정보보안 경진대회 (Ministry of Education)
                      [ text "4 CTF Challenges in two CTFs (2023): Made 2 Cryptography, 1 Pwn, 1 Web challenges. This project was a collaboration with "
                      , a [ href "https://www.stealien.com/en/main" ] [ text "STEALIEN" ]
                      , text "."
                      ]
                    , li []
                      -- BISC CTF 2023
                      [ text "A Pwnable CTF Challenge (2023): Inspired by "
                      , a [ href "https://nvd.nist.gov/vuln/detail/CVE-2018-14665" ] [ text "CVE-2018-14665" ]
                      , text "."
                      ]
                    , li [] [ text "DevSecOps Container Security Platform (2022): A container managing platform integrating image signing and vulnerability scanning in CI/CD pipelines. Most of code was written in Python, and is open source." ]
                    , li [] [ text "NFT Trading Platform (2021): Led a team of 11 students to suggest a secure NFT trading platform to a start up." ]
                    ]
                ]
            ])


ch1keenAward : CssStyling -> Html Msg
ch1keenAward cssStyling =
    section "Awards and Recognitions" cssStyling
        (ul []
            [ li [] [ text "2025 South Jeolla Province Web Security Competition - Excellence Award" ]
            , li [] [ text "4th Place, Def Con Car Hacking Village (2024)"
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


ch1keenEducation : CssStyling -> Html Msg
ch1keenEducation cssStyling =
    section "Education & Training" cssStyling
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


ch1keenCertificate : CssStyling -> Html Msg
ch1keenCertificate cssStyling =
    section "Certifications" cssStyling
        (ul []
            [ li [] [ text "Forth Class Amateur Radio Operator (Korea)" ]
              -- Information of SQL Developer
              -- vhttps://www.dataq.or.kr/www/sub/a_04.do
            , li [] [ text "SQL Developer (SQLD)" ]
              -- Information of 정보처리기사 (Engineer Information Processing)
              -- https://www.q-net.or.kr/crf005.do?id=crf00503&jmCd=1320&gbnn=gbnSubtab2
            , li [] [ text "Engineer Information Processing (정보처리기사)" ]
            ])


ch1keenFindings : CssStyling -> Html Msg
ch1keenFindings cssStyling =
    section "Vulnerability Findings" cssStyling
        (ul []
            [ li [] [ text "GHSA-wfq4-6v32-jrhq: Open Redirect in Adoptium.net" ]
            , li [] [ text "Note: Two more vulnerability have been reported to MITRE." ]
            ])


ch1keenVolunteer : CssStyling -> Html Msg
ch1keenVolunteer cssStyling =
    section "Volunteer Experience" cssStyling
        (ul []
            [ li []
                [ text "Soksok Camp(쏙쏙캠프) by Ministry of Education (Korea)"
                , ul []
                    [ li [] [ text "Each university club goes to a middle school or a high school and teaches to the student. My club went to a middle school in the Daejeon city in the summer of 2018. It was an education charity project by the Ministry of Education of Korea." ]
                    , li [] [ text "My club taught basic computer science and security to the students. One of my role was addressing the money spent by the club during the camp." ]
                    , li [] [ text "My club got a great reputation from the students, so my club awarded "
                            , strong [] [ text "a top prize (Minister of Education's)" ]
                            , text " in 2019."
                            ]
                    ]
                ]
            , li []
                [ text "Open Source Contributions"
                , ul []
                    [ li [] [ text "Nix and Ronin: Packaged the Ruby based project 'Ronin' into the Nixpkgs." ]
                    , li [] [ text "r2angr: Provided Proof-of-Concept code on how to decompile with angr." ]
                    ]
                ]
            , li []
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


footer : CssStyling -> Html Msg
footer cssStyling =
    if cssStyling == True
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
                [ onClick TogglePageStyle ]
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
                [ style "margin-bottom" "1rem", onClick TogglePageStyle ]
                [ text "Click here to go back to the web publish version of the resume." ]
            ]



view : CssStyling -> Html Msg
view cssStyling =
    div [ (if cssStyling then class "pico" else style "font-family" "Times, serif")
        , style "zoom" "87%" ]
        [ div
            [ if cssStyling then class "container" else class "" ]
            [ ch1keenTitle cssStyling
            , ch1keenProfile cssStyling
            , ch1keenCareer cssStyling
            , ch1keenFindings cssStyling
            , ch1keenVolunteer cssStyling
            , ch1keenAward cssStyling
            , ch1keenEducation cssStyling
            , ch1keenCertificate cssStyling
            ]
        , hr [ style "border-color" slate_100 ] []
        , footer cssStyling
        ]

